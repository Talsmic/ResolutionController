///ui_DataBox_Window(x,y);
/// @arg x {real}
/// @arg y {real}
var box_x = argument[0];
var box_y = argument[1];

//Box Dimensions
var box_columns = 2;
var box_rows = 6;

var x1 = camera_get_view_x( view_camera[0] );
var x2 = x1 + resolution_get_width();
var y1 = camera_get_view_y( view_camera[0] );
var y2 = y1 + resolution_get_height();
var col1 = ["_Width/Height",
			"_Virtual_Size", 
			"_GUI_Width/Height", 
			"_Camera_ViewSize",
			"WindowPoints",
			"",
			];
var col2 = [string(window_get_width())+", "+string(window_get_height()), 
			string(resolution_get_width()*resolution_get_scale())+", "+string(resolution_get_height()*resolution_get_scale()), 
			string(display_get_gui_width())+", "+string(display_get_gui_height()), 
			string(camera_get_view_width(view_camera[0]))+", "+string(camera_get_view_height(view_camera[0])),
			string(x1)+", "+string(y1), 
			string(x2)+", "+string(y2), 
			];

//Draw Box
ui_ListBackground_create(0,box_x,box_y,180,-1,box_columns,box_rows);
	ListBackground_ColumnSize[0, 1] = 110;
	ListBackground_ColumnSize[0, 2] = -1;
	ListBackground_Pad_Top[0] = 12; 
ui_ListBackground_draw();

//Draw Header
draw_set_font(ft_EvoTooltip_6_Bold);
draw_text_flatcolour(box_x+4,box_y+2,"[GML] Window_ & Display_",c_orange,1);

//Draw Table Contents
draw_array_vertical(box_x+4,box_y+13,col1,c_orange,1,12);
draw_set_halign(fa_right);
draw_array_vertical(box_x+ui_ListBackground_get_width()-4,box_y+13,col2,c_gray,1,12);
draw_set_halign(fa_left);