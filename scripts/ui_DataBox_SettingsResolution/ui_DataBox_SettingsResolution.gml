///ui_DataBox_SettingsResolution(x,y);
/// @arg x {real}
/// @arg y {real}
var box_x = argument[0];
var box_y = argument[1];

//Box Dimensions
var box_columns = 2;
var box_rows = 6;

var col1 = ["_Fullscreen", 
			"_ResolutionSnap", 
			"_Magnification", 
			"_LockedMagnification", 
			"_Vsync",
			"_ResolutionSnap"
			];
var col2 = [oResolutionController.Options_Fullscreen,
			oResolutionController.Options_ResolutionSnap,
			oResolutionController.Options_Magnification,
			oResolutionController.Options_LockedMagnification,
			oResolutionController.Options_Vsync,
			oResolutionController.Options_ResolutionSnap
			];

//Draw Box
ui_ListBackground_create(0,box_x,box_y,180,-1,box_columns,box_rows);
	ListBackground_ColumnSize[0, 1] = 110;
	ListBackground_ColumnSize[0, 2] = -1;
	ListBackground_Pad_Top[0] = 12; 
ui_ListBackground_draw();

//Draw Header
draw_set_font(ft_EvoTooltip_6_Bold);
draw_text_flatcolour(box_x+4,box_y+2,"[oResCon] Options_",c_orange,1);

//Draw Table Contents
draw_array_vertical(box_x+4,box_y+13,col1,c_green,1,12);
draw_set_halign(fa_right);
draw_array_vertical(box_x+ui_ListBackground_get_width()-4,box_y+13,col2,c_gray,1,12);
draw_set_halign(fa_left);