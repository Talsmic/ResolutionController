if !DrawGUI { return };

//Find Dimensions
var draw_space_x = camera_get_view_x(view_camera[view_current]);
var draw_space_y = camera_get_view_y(view_camera[view_current]);
draw_space_width = resolution_get_width("Playable");
draw_space_height = resolution_get_height("Playable");
var windowX = 0;
var windowY = 0;
if AnchorView {
	var windowX = camera_get_view_x(view_camera[view_current]);
	var windowY = camera_get_view_y(view_camera[view_current]);
	};

//Draw Flat Colour
if FlatBack { 
	draw_plane(draw_space_x,draw_space_y,draw_space_width,draw_space_height,FlatBack_Colour,FlatBack_Alpha);
	};

for ( bgid=1; bgid<=Backgrounds ; bgid++ ) {
	
	//Find Dimensions
	var width = sprite_get_width(BG_Sprite[bgid])*BG_ScaleX[bgid];
	var height = sprite_get_height(BG_Sprite[bgid])*BG_ScaleY[bgid];

	//Find Anchor
	switch ( BG_AnchorV[bgid] ) {
		default:
		case -1:			var anchorY = y;
		case fa_top: 		if ( AnchorView ) { var anchorY = draw_space_y } 
										 else { var anchorY = 0 };										break;
		case fa_center:		if ( AnchorView ) { var anchorY = round((draw_space_height - height) * 0.5) } 
										 else { var anchorY = round((room_height - height) * 0.5) };	break;
		case fa_bottom: 	if ( AnchorView ) { var anchorY = draw_space_height - height } 
										 else { var anchorY = room_height - height };					break;
		};
	switch ( BG_AnchorH[bgid] ) {
		default:
		case -1:			var anchorX = x;
		case fa_left: 		if ( AnchorView ) { var anchorX = draw_space_x } 
										 else { var anchorX = 0 };										break;
		case fa_center:		if ( AnchorView ) { var anchorX = round((draw_space_width - width) * 0.5) } 
										 else { var anchorX = round((room_width - width) * 0.5) };		break;
		case fa_right: 		if ( AnchorView ) { var anchorX = draw_space_width - width } 
										 else { var anchorX = room_width - width };						break;		
		};	

	//Draw Center
	DrawX = windowX+anchorX; DrawIDX = 0;
	DrawY = windowY+anchorY; DrawIDY = 0;
	event_user(1);

	//Tile
	var draw_y = height;
	var draw_x = width;
	
	//TILE UP
	if ( BG_Tile[bgid,UP] ) {
		for ( var i=1 ; draw_y+height>0 ; i++ ) {
			draw_y = anchorY - height * i
			DrawX = windowX+anchorX; DrawIDX = 0;
			DrawY = windowY+draw_y; DrawIDY = i;
			event_user(1);
			if ( BG_Tile[bgid,LEFT] ) {
				for ( var j=1 ; draw_x+width>0 ; j++ ) {
					draw_x = anchorX - width * j;
					DrawX = windowX+draw_x; DrawIDX = -j;
					event_user(1);
					};
				};
			if ( BG_Tile[bgid,RIGHT] ) {
				for ( var j=1 ; draw_x<draw_space_width ; j++ ) {
					draw_x = anchorX + width * j
					DrawX = windowX+draw_x; DrawIDX = j;
					event_user(1);
					};
				};
			};
		};
		
	//TILE DOWN
	if ( BG_Tile[bgid,DOWN] ) {
		for ( var i=1 ; draw_y<draw_space_y+draw_space_height ; i++ ) {
			draw_y = anchorY + height * i
			DrawX = windowX+anchorX; DrawIDX = 0;
			DrawY = windowY+draw_y; DrawIDY = -i;
			event_user(1);
			if ( BG_Tile[bgid,LEFT] ) {
				for ( var j=1 ; draw_x+width>0 ; j++ ) {
					draw_x = anchorX - width * j;
					DrawX = windowX+draw_x; DrawIDX = -j;
					event_user(1);
					};
				};
			if ( BG_Tile[bgid,RIGHT] ) {
				for ( var j=1 ; draw_x<draw_space_x+draw_space_width ; j++ ) {
					draw_x = anchorX + width * j
					DrawX = windowX+draw_x; DrawIDX = j;
					event_user(1);
					};
				};
			};
		};
		
	//TILE LEFT
	if ( BG_Tile[bgid,LEFT] ) {
		for ( var j=1 ; draw_x+width>0 ; j++ ) {
			draw_x = anchorX - width * j;
			DrawX = windowX+draw_x; DrawIDX = -j;
			DrawY = windowY+anchorY; DrawIDY = 0;
			event_user(1);
			};
		};
		
	//TILE RIGHT
	if ( BG_Tile[bgid,RIGHT] ) {
		for ( var j=1 ; draw_x<draw_space_x+draw_space_width ; j++ ) {
			draw_x = anchorX + width * j
			DrawX = windowX+draw_x; DrawIDX = j;
			DrawY = windowY+anchorY; DrawIDY = 0;
			event_user(1);
			};
		};
		
	};