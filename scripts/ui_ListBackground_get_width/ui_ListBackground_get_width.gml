///ui_ListBackground_get_width([ListBackgroundID]);
/// @arg [ListBackgroundID] {integer}	(default: 0)
/*
	>Returns {integer}: [ListBackgroundID] Predicted Draw Width
*/
var ref = 0;
if ( argument_count > 0 ) { ref = argument[0] };

#region Find or make Variables
//Basics
var box_width = -1;
var column_count = 5;
if ( variable_instance_exists(id,"ListBackground_Width") ) { box_width = ListBackground_Width[ref] };
if ( variable_instance_exists(id,"ListBackground_ColumnCount") ) { column_count = ListBackground_ColumnCount[ref] };
//Padding
var padding = [0,4,4,4,4];
var spacing = [3,1];
if ( variable_instance_exists(id,"ListBackground_Pad_Left") ) { padding[LEFT] = ListBackground_Pad_Left[ref] };
if ( variable_instance_exists(id,"ListBackground_Pad_Right") ) { padding[RIGHT] = ListBackground_Pad_Right[ref] };
if ( variable_instance_exists(id,"ListBackground_ColumnSpace") ) { spacing[0] = ListBackground_ColumnSpace[ref] };
//Column Data
var column_size = array_create(column_count+1,-1);
for ( var i=0 ; i<=column_count ; i++ ) {
	if ( variable_instance_exists(id,"ListBackground_ColumnSize") ) { column_size[i] = ListBackground_ColumnSize[ref,i] };
	};
var header_column = false;
if ( variable_instance_exists(id,"ListBackground_HeaderColumn") ) { header_column = ListBackground_HeaderColumn[ref] };
if ( header_column ) { var col_start = 0 } else { var col_start = 1 };
#endregion

#region Check Width
var default_columnsize = 30;
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
#endregion

return box_width;