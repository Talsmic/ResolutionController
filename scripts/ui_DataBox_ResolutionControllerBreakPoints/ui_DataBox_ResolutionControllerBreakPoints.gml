///ui_DataBox_ResolutionControllerBreakPoints(x,y);
/// @arg x {real}
/// @arg y {real}
var box_x = argument[0];
var box_y = argument[1];

//Box Dimensions
var box_columns = 2;
var box_rows = array_length_1d(oResolutionController.Breakpoints_Height);

var col1 = oResolutionController.Breakpoints_Width;
var col2 = oResolutionController.Breakpoints_Height;

//Draw Box
ui_ListBackground_create(0,box_x,box_y,84,-1,box_columns,box_rows);
	ListBackground_ColumnSize[0, 1] = -1;
	ListBackground_ColumnSize[0, 2] = -1;
	ListBackground_Pad_Top[0] = 12; 
ui_ListBackground_draw();

//Draw Header
draw_set_font(ft_EvoTooltip_6_Bold);
draw_text_flatcolour(box_x+4,box_y+2,"Breakpoints:",c_orange,1);

//Draw Table Contents
var highlight = resolution_get_scale();
draw_set_halign(fa_right);
draw_array_vertical(box_x+ui_ListBackground_get_width()*0.5-4,box_y+13,col1,c_gray,1,12);
draw_text_flatcolour(box_x+ui_ListBackground_get_width()*0.5-4,box_y+13+12*highlight,col1[highlight],c_purple,1);
draw_set_halign(fa_left);
draw_array_vertical(box_x+ui_ListBackground_get_width()*0.5+4,box_y+13,col2,c_gray,1,12);
draw_text_flatcolour(box_x+ui_ListBackground_get_width()*0.5+4,box_y+13+12*highlight,col2[highlight],c_purple,1);

