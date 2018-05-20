///ui_ListBackground_draw([ListBackgroundID],[x_offset],[y_offset]);
/// @arg [ListBackgroundID] {integer}	(default: 0)
/// @arg [x_offset] {real}				(default: 0)
/// @arg [y_offset] {real}				(default: 0)
var ref = 0;
if ( argument_count > 0 ) { ref = argument[0] };
LastListRegions = 0;

#region Find Draw Location
var box_x = 0;
var box_y = 0;
if ( variable_instance_exists(id,"ListBackground_X") ) { box_x = ListBackground_X[ref] };
if ( variable_instance_exists(id,"ListBackground_Y") ) { box_y = ListBackground_Y[ref] };
if ( argument_count > 1 ) { box_x += argument[1] };
if ( argument_count > 2 ) { box_y += argument[2] };
#endregion

#region Find or make Variables
//Basics
var box_width = -1;
var box_height = -1;
var column_count = 5;
var row_count = 5;
if ( variable_instance_exists(id,"ListBackground_Width") ) { box_width = ListBackground_Width[ref] };
if ( variable_instance_exists(id,"ListBackground_Height") ) { box_height = ListBackground_Height[ref] };
if ( variable_instance_exists(id,"ListBackground_ColumnCount") ) { column_count = ListBackground_ColumnCount[ref] };
if ( variable_instance_exists(id,"ListBackground_RowCount") ) { row_count = ListBackground_RowCount[ref] };
//Padding
var padding = [0,4,4,4,4];
var spacing = [1,1];
if ( variable_instance_exists(id,"ListBackground_Pad_Top") ) { padding[TOP] = ListBackground_Pad_Top[ref] };
if ( variable_instance_exists(id,"ListBackground_Pad_Bottom") ) { padding[BOTTOM] = ListBackground_Pad_Bottom[ref] };
if ( variable_instance_exists(id,"ListBackground_Pad_Left") ) { padding[LEFT] = ListBackground_Pad_Left[ref] };
if ( variable_instance_exists(id,"ListBackground_Pad_Right") ) { padding[RIGHT] = ListBackground_Pad_Right[ref] };
if ( variable_instance_exists(id,"ListBackground_ColumnSpace") ) { spacing[0] = ListBackground_ColumnSpace[ref] };
if ( variable_instance_exists(id,"ListBackground_RowSpace") ) { spacing[1] = ListBackground_RowSpace[ref] };
//Column Data
var column_size = array_create(column_count+1,-1);
var column_colour = array_create(column_count+1,c_white);
var column_alpha = array_create(column_count+1,0.2);
var column_mouseovers = array_create(column_count+1,false);
for ( var i=0 ; i<=column_count ; i++ ) {
	if ( variable_instance_exists(id,"ListBackground_ColumnSize") ) { column_size[i] = ListBackground_ColumnSize[ref,i] };
	if ( variable_instance_exists(id,"ListBackground_ColumnColour") ) { column_colour[i] = ListBackground_ColumnColour[ref,i] };
	if ( variable_instance_exists(id,"ListBackground_ColumnAlpha") ) { column_alpha[i] = ListBackground_ColumnAlpha[ref,i] };
	if ( variable_instance_exists(id,"ListBackground_ColumnMouseovers") ) { column_mouseovers[i] = ListBackground_ColumnMouseovers[ref,i] };
	};
var header_column = false;
if ( variable_instance_exists(id,"ListBackground_HeaderColumn") ) { header_column = ListBackground_HeaderColumn[ref] };
if ( header_column ) { var col_start = 0 } else { var col_start = 1 };
//Row Data
var row_size = array_create(row_count+1,-1);
var row_colour = array_create(row_count+1,c_white);
var row_alpha = array_create(row_count+1,0.2);
var row_mouseovers = array_create(row_count+1,false);
for ( var i=0 ; i<=row_count ; i++ ) {
	if ( variable_instance_exists(id,"ListBackground_RowSize") ) { row_size[i] = ListBackground_RowSize[ref,i] };
	if ( variable_instance_exists(id,"ListBackground_RowColour") ) { row_colour[i] = ListBackground_RowColour[ref,i] };
	if ( variable_instance_exists(id,"ListBackground_RowAlpha") ) { row_alpha[i] = ListBackground_RowAlpha[ref,i] };
	if ( variable_instance_exists(id,"ListBackground_RowMouseovers") ) { row_mouseovers[i] = ListBackground_RowMouseovers[ref,i] };
	};
var header_row = false;
if ( variable_instance_exists(id,"ListBackground_HeaderRow") ) { header_row = ListBackground_HeaderRow[ref] };
if ( header_row ) { var row_start = 0 } else { var row_start = 1 };
#endregion

#region Adapt Dimensions
var default_columnsize = 30;
var default_rowsize = 11;
//TrueWidth
if ( box_width == -1 ) {
	//+Padding
	box_width = padding[LEFT] + padding[RIGHT];
	//+Column Widths
	for ( var i=col_start ; i<=column_count ; i++ ) {
		if ( column_size[i] != -1 ) { box_width += column_size[i] } else { box_width += default_columnsize };
		};
	if ( column_count+1-col_start > 1 ) { box_width += spacing[0] * (column_count-col_start) };
	};
//TrueHeight
if ( box_height == -1 ) {
	//+Padding
	box_height = padding[TOP] + padding[BOTTOM];
	//+Row Heights
	for ( var i=row_start ; i<=row_count ; i++ ) {
		if ( row_size[i] != -1 ) { box_height += row_size[i] } else { box_height += default_rowsize };
		};
	if ( row_count+1-row_start > 1 ) { box_height += spacing[1] * (row_count-row_start) };
	};
//TrueColumnSize
var slots_to_fill = column_count+1-col_start;
var availible_space = box_width - padding[LEFT] - padding[RIGHT];
if ( column_count+1-col_start > 1 ) { availible_space -= spacing[0] * (column_count-col_start) };
//Find Columns that actually need to be resized
for ( var i=col_start ; i<=column_count ; i++ ) {
	if ( column_size[i] != -1 ) { availible_space -= column_size[i]; slots_to_fill--  };
	};
//Resize Columns
for ( var i=col_start ; i<=column_count ; i++ ) {
	if ( column_size[i] == -1 ) { 
		column_size[i] = availible_space div slots_to_fill;  
		availible_space -= availible_space div slots_to_fill;
		slots_to_fill--;
		if ( !slots_to_fill ) column_size[i] += availible_space;		
		};
	};
//TrueRowSize
slots_to_fill = row_count+1-row_start;
availible_space = box_height - padding[TOP] - padding[BOTTOM];
if ( row_count+1-row_start > 1 ) { availible_space -= spacing[1] * (row_count-1) };
//Find Rows that actually need to be resized
for ( var i=row_start ; i<=row_count ; i++ ) {
	if ( row_size[i] != -1 ) { availible_space -= row_size[i]; slots_to_fill--  };
	};
//Resize Rows
for ( var i=row_start ; i<=row_count ; i++ ) {
	if ( row_size[i] == -1 ) { 
		row_size[i] = availible_space div slots_to_fill;  
		availible_space -= availible_space div slots_to_fill;
		slots_to_fill--;
		if ( !slots_to_fill ) row_size[i] += availible_space;		
		};
	};
#endregion

#region Draw
//Draw Box
draw_simplebox(box_x,box_y,box_width,box_height);
//Draw Columns
var draw_x = box_x + padding[LEFT];
var draw_y = box_y + padding[TOP];
if ( header_row ) { draw_y += row_size[0] + spacing[1] };
for ( var i=col_start ; i<=column_count ; i++ ) {
	//Draw the column
	ui_draw_column(draw_x,draw_y,row_count,column_size[i],row_size,spacing[1],column_colour[i],column_alpha[i],column_mouseovers[i]);
	//Find Column as 1D Array
	var col = ui_saveregions_column(draw_x,draw_y,row_count,column_size[i],row_size,spacing[1]);
	//Save Cells to 2D Array
	for ( var j=1 ; j<array_length_1d(col) ; j++ ) {
		LastListRegions[i,j] = col[j]
		};	
	//Move Draw Point
	draw_x += column_size[i] + spacing[0];
	};
//Draw Rows
draw_x = box_x + padding[LEFT];
draw_y = box_y + padding[TOP];
if ( header_column ) { draw_x += column_size[0] + spacing[0]};
for ( var i=row_start ; i<=row_count ; i++ ) {
	//Draw the Row
	ui_draw_row(draw_x,draw_y,column_count,column_size,row_size[i],spacing[0],row_colour[i],row_alpha[i],row_mouseovers[i]);
	//Move Draw Point
	draw_y += row_size[i] + spacing[1];
	};
#endregion
