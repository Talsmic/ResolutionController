/// @desc Updates (Every Update Window)
alarm[0] = 10;

repeat 3 {
	if ( ShiftingTiles_Columns > array_length_1d(ShiftingTiles_ColumnHeight) ) {
		ShiftingTiles_ColumnHeight[array_length_1d(ShiftingTiles_ColumnHeight)] = 
		ShiftingTiles_ColumnHeight[array_length_1d(ShiftingTiles_ColumnHeight)-1];
		};
	};

for ( var i=0 ; i<array_length_1d(ShiftingTiles_ColumnHeight) ; i++) {
	var aimheight = irandom_range(ShiftingTiles_MinRows,ShiftingTiles_MaxRows);
	if ( aimheight > ShiftingTiles_ColumnHeight[i] ) { ShiftingTiles_ColumnHeight[i]++ };
	if ( aimheight < ShiftingTiles_ColumnHeight[i] ) { ShiftingTiles_ColumnHeight[i]-- };
	};
	
