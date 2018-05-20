///ui_ListBackground_create([ListBackgroundID],[x],[y],[width],[height],[columns],[rows]);
/// @arg [ListBackgroundID] {integer}	(default: 0)
/// @arg [x] {real}					(default: id.x)
/// @arg [y] {real}					(default: id.y)
/// @arg [width] {integer}			(default: -1)
/// @arg [height] {integer}			(default: -1)
/// @arg [columns] {integer}		(default: 1)
/// @arg [rows] {integer}			(default: 1)
var ref = 0;
if ( argument_count > 0 ) { ref = argument[0] };

ListBackground_X[ref] = x;				if ( argument_count > 1 ) { ListBackground_X[ref] = argument[1] };
ListBackground_Y[ref] = y;				if ( argument_count > 2 ) { ListBackground_Y[ref] = argument[2] };
ListBackground_Width[ref] = -1;			if ( argument_count > 3 ) { ListBackground_Width[ref] = argument[3] };
ListBackground_Height[ref] = -1;		if ( argument_count > 4 ) { ListBackground_Height[ref] = argument[4] };
ListBackground_ColumnCount[ref] = 1;	if ( argument_count > 5 ) { ListBackground_ColumnCount[ref] = argument[5] };
ListBackground_RowCount[ref] = 1;		if ( argument_count > 6 ) { ListBackground_RowCount[ref] = argument[6] };

for ( var i=0 ; i<=ListBackground_ColumnCount[ref] ; i++ ) {
	ListBackground_ColumnSize[ref, i] = -1; 
	if ( i mod 2 > 0 ) { ListBackground_ColumnColour[ref, i] = c_white	}
				  else { ListBackground_ColumnColour[ref, i] = c_gray };
	if ( i == 0 )	   { ListBackground_ColumnColour[ref, i] = c_orange	};
	ListBackground_ColumnAlpha[ref, i] = 0.2; 
	if ( i == 0 )	   { ListBackground_ColumnAlpha[ref, i] = 0.4	};
	ListBackground_ColumnMouseovers[ref, i] = false; //1 for normal 2 for gui
	};
ListBackground_ColumnSpace[ref] = 1; 
ListBackground_HeaderColumn[ref] = false; 

for ( var i=0 ; i<=ListBackground_RowCount[ref] ; i++ ) {
	ListBackground_RowSize[ref, i] = -1; 
	if ( i mod 2 > 0 ) { ListBackground_RowColour[ref, i] = c_white	}
				  else { ListBackground_RowColour[ref, i] = c_gray };
	if ( i == 0 )	   { ListBackground_RowColour[ref, i] = c_orange	};
	ListBackground_RowAlpha[ref, i] = 0; 
	if ( i == 0 )	   { ListBackground_RowAlpha[ref, i] = 0.4	};
	ListBackground_RowMouseovers[ref, i] = false; //1 for normal 2 for gui
	};
ListBackground_RowSpace[ref] = 1; 
ListBackground_HeaderRow[ref] = false; 
	
ListBackground_Pad_Top[ref] = 4; 
ListBackground_Pad_Bottom[ref] = 2; 
ListBackground_Pad_Left[ref] = 2; 
ListBackground_Pad_Right[ref] = 2; 