///ui_ListBackground_get_height([ListBackgroundID]);
/// @arg [ListBackgroundID] {integer}	(default: 0)
/*
	>Returns {integer}: [ListBackgroundID] Predicted Draw Height
*/
var ref = 0;
if ( argument_count > 0 ) { ref = argument[0] };

#region Find or make Variables
//Basics
var box_height = -1;
var row_count = 5;
if ( variable_instance_exists(id,"ListBackground_Height") ) { box_height = ListBackground_Height[ref] };
if ( variable_instance_exists(id,"ListBackground_RowCount") ) { row_count = ListBackground_RowCount[ref] };
//Padding
var padding = [0,4,4,4,4];
var spacing = [1,1];
if ( variable_instance_exists(id,"ListBackground_Pad_Left") ) { padding[TOP] = ListBackground_Pad_Top[ref] };
if ( variable_instance_exists(id,"ListBackground_Pad_Right") ) { padding[BOTTOM] = ListBackground_Pad_Bottom[ref] };
if ( variable_instance_exists(id,"ListBackground_RowSpace") ) { spacing[0] = ListBackground_RowSpace[ref] };
//Row Data
var row_size = array_create(row_count+1,-1);
for ( var i=0 ; i<=row_count ; i++ ) {
	if ( variable_instance_exists(id,"ListBackground_RowSize") ) { row_size[i] = ListBackground_RowSize[ref,i] };
	};
var header_row = false;
if ( variable_instance_exists(id,"ListBackground_HeaderRow") ) { header_row = ListBackground_HeaderRow[ref] };
if ( header_row ) { var row_start = 0 } else { var row_start = 1 };
#endregion

heightA = box_height;

#region Check Height
var default_rowsize = 11;
//TrueHeight
if ( box_height == -1 ) {
	//+Padding
	box_height = padding[TOP] + padding[BOTTOM];
	heightB = box_height;
	//+Row Heights
	for ( var i=row_start ; i<=row_count ; i++ ) {
		if ( row_size[i] != -1 ) { box_height += row_size[i] } else { box_height += default_rowsize };
		};
	if ( row_count+1-row_start > 1 ) { box_height += spacing[0] * (row_count-row_start) };
	heightC = box_height;
	};
#endregion

return box_height;