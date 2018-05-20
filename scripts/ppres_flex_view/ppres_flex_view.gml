///ppres_flex_view([view],[room]);
/// @arg [view] {ViewID}	(default: view_current)
/// @arg [room] {RoomID}	(default: room)
/*
	[PPC][Module:Resolution]
	Adjusts the view to fit the current resolution and room
*/
var flex_view = view_current;
if ( argument_count > 0 ) { flex_view = argument[0] };
var flex_room = room; 
if ( argument_count > 1 ) { flex_room = argument[1] };

//Adjust the flex_view size to fit the screen
view_xport[flex_view] = 0;
view_yport[flex_view] = 0;
view_wport[flex_view] = Resolution_PlayableWidth;
view_hport[flex_view] = Resolution_PlayableHeight;
camera_set_view_size( view_camera[flex_view], view_wport[flex_view], view_hport[flex_view] );

//Adjust the flex_view location if the flex_view size has changed
var width_change = Resolution_ViewWidth - Resolution_PlayableWidth;
var height_change = Resolution_ViewHeight - Resolution_PlayableHeight;
if ( width_change != 0 or height_change != 0 ) {
	var x_changed = camera_get_view_x( view_camera[flex_view] ) + floor(width_change*0.5);
	var y_changed = camera_get_view_y( view_camera[flex_view] ) + floor(height_change*0.5);
	if ( x_changed < 0 ) { x_changed = 0 };
	if ( y_changed < 0 ) { y_changed = 0 };	
	camera_set_view_pos( view_camera[flex_view], x_changed, y_changed );
	};
//Snap Small rooms to 0,0
if ( Resolution_ViewWidth <= Resolution_PlayableWidth and !camera_get_view_x(view_camera[flex_view]) ) 
	{ camera_set_view_pos( view_camera[flex_view], 0, camera_get_view_y(view_camera[flex_view]) ); };
if ( Resolution_ViewHeight <= Resolution_PlayableHeight and !camera_get_view_y(view_camera[flex_view]) ) 
	{ camera_set_view_pos( view_camera[flex_view], camera_get_view_x(view_camera[flex_view]), 0 ); };
	
//Room Specific Anchors
var anchors = ppres_room_anchors(flex_room);
if ( anchors[0] ) {	
	camera_set_view_pos( view_camera[flex_view], anchors[1] - floor(Resolution_PadWidth*0.5), anchors[2] - floor(Resolution_PadHeight*0.5)  );
	};

//Save New Dimensions
Resolution_ViewWidth = view_wport[flex_view];
Resolution_ViewHeight = view_hport[flex_view];

/*=[Notes]======================================================================
	-	For the default functionality, don't bother providing arguments, they 
		are an option offered should circumstances arise that you are resizing 
		a view you aren't using, or adjusting for a room other than the 
		currently being displayed room.
