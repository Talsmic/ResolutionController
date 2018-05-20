/// @desc Floating Pixel Correction

if ( FloatingPixels_Width or FloatingPixels_Height ) {
	if ( !Options_Fullscreen) {
		show_debug_message("Event: Floating Pixel Correction");
		window_set_size(Resolution_CompleteWidth*Resolution_Magnification, Resolution_CompleteHeight*Resolution_Magnification);
		alarm[1] = 1; //prepare the Resolution Correction event 
		};
	};
