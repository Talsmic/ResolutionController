//Find Dimensions
var draw_space_x = camera_get_view_x(view_camera[view_current]);
var draw_space_y = camera_get_view_y(view_camera[view_current]);
draw_space_width = resolution_get_width();
draw_space_height = resolution_get_height();
var windowX = 0;
var windowY = 0;
if ( AnchorView ) {
	var windowX = camera_get_view_x(view_camera[view_current]);
	var windowY = camera_get_view_y(view_camera[view_current]);
	};

//Draw Flat Colour
if ( FlatBack ) { 
	draw_plane(draw_space_x,draw_space_y,draw_space_width,draw_space_height,FlatBack_Colour,FlatBack_Alpha);
	};

for ( bgid=1; bgid<=Backgrounds ; bgid++ ) {
	
	//Find Dimensions
	var width = sprite_get_width(BG_Sprite[bgid])*BG_ScaleX[bgid];
	var height = sprite_get_height(BG_Sprite[bgid])*BG_ScaleY[bgid];
	
	//Tile
	var draw_y = height;
	var draw_x = width;
	
	ShiftingTiles_Columns = ceil(draw_space_width/width)+1;
	
	//TILE UP
	for ( var col=0 ; col<array_length_1d(ShiftingTiles_ColumnHeight) ; col++) {
		for ( var row=0 ; row<ShiftingTiles_ColumnHeight[col] ; row++) {
			draw_x = -3 + width * col;
			draw_y = -3 + draw_space_height - height * row;
			DrawX = windowX+draw_x; DrawIDX = row;
			DrawY = windowY+draw_y; DrawIDY = col;
			BG_Alpha[bgid] = (ShiftingTiles_ColumnHeight[col]-row)*ShiftingTiles_AlphaFalloff;
			if ( BG_Alpha[bgid] > (ShiftingTiles_MaxRows-row)*ShiftingTiles_AlphaClimb ) {
				BG_Alpha[bgid] = (ShiftingTiles_MaxRows-row)*ShiftingTiles_AlphaClimb };
			event_user(1);
			};
		if ( ShiftingTiles_Backgrounding ) {
			var rowheight = ceil(draw_space_height/height)+1;
			for ( var row=ShiftingTiles_ColumnHeight[col] ; row<rowheight ; row++) {
				draw_x = -3 + width * col;
				draw_y = -3 + draw_space_height - height * row;
				DrawX = windowX+draw_x; DrawIDX = row;
				DrawY = windowY+draw_y; DrawIDY = col;
				BG_Alpha[bgid] = 0.02;
				event_user(1);
				};
			};
		};
		
	};