///ui_DataBox_ResolutionControllerMacros(x,y);
/// @arg x {real}
/// @arg y {real}
var box_x = argument[0];
var box_y = argument[1];

//Box Dimensions
var box_columns = 2;
var box_rows = 4;

//Values
var col1 = ["PPRES_Ideal",
			"PPRES_Min",
			"PPRES_Max",
			"PPRES_MinWindow",
			];
var col2 = [string(PPRES_IdealWidth)+", "+string(PPRES_IdealHeight), 
			string(PPRES_MinWidth)+", "+string(PPRES_MinHeight), 
			string(PPRES_MaxWidth)+", "+string(PPRES_MaxHeight), 
			string(PPRES_MinWindowWidth)+", "+string(PPRES_MinWindowHeight), 
			];
			
//Draw Box
ui_ListBackground_create(0,box_x,box_y,180,-1,box_columns,box_rows);
	ListBackground_ColumnSize[0, 1] = 110;
	ListBackground_ColumnSize[0, 2] = -1;
	ListBackground_Pad_Top[0] = 12; 
ui_ListBackground_draw();

//Draw Header
draw_set_font(ft_EvoTooltip_6_Bold);
draw_text_flatcolour(box_x+4,box_y+2,"[oResCon] Macros",c_orange,1);

//Draw Table Contents
draw_array_vertical(box_x+4,box_y+13,col1,c_red,1,12);
draw_set_halign(fa_right);
draw_array_vertical(box_x+ui_ListBackground_get_width()-4,box_y+13,col2,c_gray,1,12);
draw_set_halign(fa_left);