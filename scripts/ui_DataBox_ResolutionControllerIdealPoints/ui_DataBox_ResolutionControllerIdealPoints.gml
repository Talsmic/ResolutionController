///ui_DataBox_ResolutionControllerIdealPoints(x,y);
/// @arg x {real}
/// @arg y {real}
var box_x = argument[0];
var box_y = argument[1];

//Box Dimensions
var box_columns = 2;
var box_rows = 5;

var col1 = [PPRES_IdealWidth,
			PPRES_IdealWidth*2, 
			PPRES_IdealWidth*3, 
			PPRES_IdealWidth*4, 
			PPRES_IdealWidth*5, 
			];
var col2 = [PPRES_IdealHeight,
			PPRES_IdealHeight*2, 
			PPRES_IdealHeight*3, 
			PPRES_IdealHeight*4, 
			PPRES_IdealHeight*5, 
			];

//Draw Box
ui_ListBackground_create(0,box_x,box_y,84,-1,box_columns,box_rows);
	ListBackground_ColumnSize[0, 1] = -1;
	ListBackground_ColumnSize[0, 2] = -1;
	ListBackground_Pad_Top[0] = 12; 
ui_ListBackground_draw();

//Draw Header
draw_set_font(ft_EvoTooltip_6_Bold);
draw_text_flatcolour(box_x+4,box_y+2,"Ideal Sizes:",c_orange,1);

//Draw Table Contents
draw_set_halign(fa_right);
draw_array_vertical(box_x+ui_ListBackground_get_width()*0.5-4,box_y+13,col1,c_gray,1,12);
if ( col1[0] = window_get_width() ) { draw_text_flatcolour(box_x+ui_ListBackground_get_width()*0.5-4,box_y+13,col1[0],c_purple,1) };
for ( var i=1 ; i<array_length_1d(col1) ; i++ ) {
	if ( col1[i] = window_get_width() ) { draw_text_flatcolour(box_x+ui_ListBackground_get_width()*0.5-4,box_y+13+12*i,col1[i],c_purple,1) };
	if ( col1[i-1] < window_get_width() and col1[i] > window_get_width() ) {
		draw_plane(box_x+2,box_y+11+12*i,ui_ListBackground_get_width()*0.5-3,1,c_purple,1)	};
	};
draw_set_halign(fa_left);
draw_array_vertical(box_x+ui_ListBackground_get_width()*0.5+4,box_y+13,col2,c_gray,1,12);
if ( col2[0] = window_get_width() ) { draw_text_flatcolour(box_x+ui_ListBackground_get_width()*0.5+4,box_y+13,col2[0],c_purple,1) };
for ( var i=1 ; i<array_length_1d(col2) ; i++ ) {
	if ( col2[i] = window_get_height() ) { draw_text_flatcolour(box_x+ui_ListBackground_get_width()*0.5+4,box_y+13+12*i,col2[i],c_purple,1) };
	if ( col2[i-1] < window_get_height() and col2[i] > window_get_height() ) {
		draw_plane(box_x+ui_ListBackground_get_width()*0.5,box_y+11+12*i,ui_ListBackground_get_width()*0.5-2,1,c_purple,1)	};
	};

