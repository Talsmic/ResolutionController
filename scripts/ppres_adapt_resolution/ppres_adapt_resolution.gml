///ppres_adapt_resolution();
/*
	[PPC][Controller Function]
	This function performs all the important elements on the resolution system.
	In order this function:
	  -	Defines how to decide scaling (determined by your settings)
	  - Toggle fullscreen (determined by your settings)
	  - Center the window (as required)
	  -	Snaps to an ideal resolution (as required)
	
*/
var window_width = window_get_width_safe();
var window_height = window_get_height_safe();

#region Define Scaling Breakpoints
/*	These dictate how the controller decides what what resoution magnification 
	level to use, and can be altered by changing PPRES_Magnification_Min and
	PPRES_Magnification_Max.
	You can also force the game to ignore these by setting 
	Options_LockedMagnification to true, which will tell the controller to use 
	Options_Magnification to dictate scaling instead.*/
Breakpoints_Width = [ 0, PPRES_MinWindowWidth ]
Breakpoints_Height = [ 0, PPRES_MinWindowHeight ]
for ( var i = 2; i <= PPRES_Magnification_Max ; i++ ) {
	//By default, the breakpoints are when the window the minumum over the ideal 
	Breakpoints_Width[i] = PPRES_IdealWidth * ( i-1 ) + PPRES_MinWidth;
	Breakpoints_Height[i] = PPRES_IdealHeight * ( i-1 ) + PPRES_MinHeight;
	//If RubberBanding is enabled, breakpoints are only to ideal resolutions
	if ( PPRES_Magnification_RubberBanding ) {
		Breakpoints_Width[i] = PPRES_IdealWidth * i;
		Breakpoints_Height[i] = PPRES_IdealWidth * i;
		};
	//If the minimum scaling is higher than 1, this will force the breakpoints to match
	if ( PPRES_Magnification_Min >= i ) {
		Breakpoints_Width[i] = PPRES_MinWindowWidth;
		Breakpoints_Height[i] = PPRES_MinWindowHeight;
		};
	}; #endregion

#region Fullscreen Correction
/*	Checks to make sure fullscreen is active if it should be, or turns it off if
	it shouldn't be.
	If PPRES_Fullscreen_ToggleEnable is false, PPRES_Fullscreen_AtBoot always 
	determines the result of this, otherwise Options_Fullscreen does.*/
if ( PPRES_Fullscreen_ToggleEnable ) {
	if ( window_get_fullscreen() != Options_Fullscreen ) {
		ResolutionSnapNextFrame = true;
		window_set_fullscreen(Options_Fullscreen);
		};
	}
else {
	if ( window_get_fullscreen() != PPRES_Fullscreen_AtBoot ) {
		ResolutionSnapNextFrame = true;
		window_set_fullscreen(PPRES_Fullscreen_AtBoot);
		};
	}; #endregion

#region Center The Screen
/*	Centering the screen at the same time as making certain window changes will
	produce wonky results, by delaying the centering it corrects this behaviour*/
if ( ResolutionCenterNextFrame ) {
	window_center();
	ResolutionCenterNextFrame = false;
	show_debug_message("Event: Window Centering");
	}; #endregion

#region Snap To Ideal Resolution
/*	Forces the resolution of the window to seek an ideal resolution */
if ( ResolutionSnapNextFrame ) {
	show_debug_message("Event: Resolution Snap ["+string(ResolutionSnap_Magnification*PPRES_IdealWidth)+"x"+string(ResolutionSnap_Magnification*PPRES_IdealHeight)+"]");
	window_set_size( ResolutionSnap_Magnification*PPRES_IdealWidth, ResolutionSnap_Magnification*PPRES_IdealHeight );
	ResolutionSnapNextFrame = false;
	ResolutionCenterNextFrame = true;
	if ( window_get_width() != ResolutionSnap_Magnification*PPRES_IdealWidth or window_get_height() != ResolutionSnap_Magnification*PPRES_IdealHeight ) {
		show_debug_message("Error: Resolution Snap not correctly registered");
		ResolutionSnapNextFrame = true;
		};
	
	}; #endregion

#region Update Magnification Level
/*	Forces the resolution of the window to seek an ideal resolution */
if ( Options_LockedMagnification ) {
	Resolution_Magnification = Options_Magnification	
	}
else {
	Resolution_Magnification = PPRES_Magnification_Min;
	for ( var i=1 ; i<=PPRES_Magnification_Max ; i++ ) {
		if ( window_width >= Breakpoints_Width[i] and window_height >= Breakpoints_Height[i] ) {
			Resolution_Magnification = i;
			};
		};
	}; #endregion
	
#region Update Stored Dimensions
/*	You can access these variables through the oResolutionController and they 
	are incredibly useful for sizing and placing UIs on the screen.
	[Resolution_CompleteWidth/Height] store the entire window size in pixels, 
	  before scaling 
	[FloatingPixels_Width/Height] stores the leftovers that can't be scaled 
	  properly, this is used to avoid wonky scaling at odd window sizes. */
Resolution_CompleteWidth	= window_width div Resolution_Magnification;
Resolution_CompleteHeight	= window_height div Resolution_Magnification;
FloatingPixels_Width		= window_width mod Resolution_Magnification;
FloatingPixels_Height		= window_height mod Resolution_Magnification;
//If the window is minimised
/*	[Resolution_PlayableWidth/Height] store the area on the screen inside the 
	  margins. If there are margins, this will be the same as Resolution_Complete.
	[Resolution_PadWidth/Height] stores how far from Ideal the screen size is.
	  If postive, this is the added vision, but doesn't include any margins.
	  If negative, this is the lost vision. */
if ( Resolution_CompleteWidth > PPRES_MaxWidth )   { Resolution_PlayableWidth  = PPRES_MaxWidth };
											  else { Resolution_PlayableWidth  = Resolution_CompleteWidth };
if ( Resolution_CompleteHeight > PPRES_MaxHeight ) { Resolution_PlayableHeight = PPRES_MaxHeight };
											  else { Resolution_PlayableHeight = Resolution_CompleteHeight };
Resolution_PadWidth	 = Resolution_PlayableWidth - PPRES_IdealWidth;
Resolution_PadHeight = Resolution_PlayableHeight - PPRES_IdealHeight;
#endregion

#region Update Cursor
/*	If PPRES_Cursor is enabled, this sets the cursor graphic to match the 
	maginfication size of the screen.
	[WIP] I may update this with a better solution down the track*/
if ( PPRES_Cursor ) {
	switch ( Resolution_Magnification ) {
		case 1: 			cursor_sprite = spr_cursor;		break;
		case 2:				cursor_sprite = spr_cursor_x2;	break;
		case 3:				cursor_sprite = spr_cursor_x3;	break;
		case 4:				cursor_sprite = spr_cursor_x4;	break;
		case 5:	default:	cursor_sprite = spr_cursor_x5;	break;
		};
	}; #endregion

#region Resize and Reposition GUI Layer
/*	If PPRES_GUIScaling is less than or equal 0, adaptable scaling is enabled
	and the GUI layer will match the magnification size. Otherwise, the GUI 
	layer has fixed magnification and won't scale.
	If PPRES_GUISnap is enabled, the GUI can only exist within the playable area 
	of the screen, otherwise it can exist over the margins (should they exist). */
if PPRES_GUISnap {
	var a = application_get_position();
	Resolution_GUIxOffset = a[0];
	ppres_GUIyOffset = a[1];
	}
else {
	Resolution_GUIxOffset = 0;
	Resolution_GUIyOffset = 0;
	};
if ( PPRES_GUIScaling < 1 ) {
	display_set_gui_size(Resolution_CompleteWidth, Resolution_CompleteHeight);
	display_set_gui_maximise( Resolution_Magnification, Resolution_Magnification, Resolution_GUIxOffset, Resolution_GUIyOffset );
	}
else {
	display_set_gui_size(Resolution_CompleteWidth, Resolution_CompleteHeight);
	display_set_gui_maximise( PPRES_GUIScaling, PPRES_GUIScaling, Resolution_GUIxOffset, Resolution_GUIyOffset );
	};
#endregion

#region Resize and Reposition View and Camera
/*	Runs the function that resizes the camera and views */
ppres_flex_view(view_current);
#endregion

#region Resize the application surface
/*This is important even if you're not using the application surface redraw features */
if ( !surface_exists(application_surface) ) {  }
else {
	surface_resize( application_surface, Resolution_PlayableWidth, Resolution_PlayableHeight )
	};
#endregion
