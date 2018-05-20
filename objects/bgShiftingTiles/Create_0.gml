// Inherit the parent event
event_inherited();

BG_Sprite[1] = bg_square;
BG_Tint[1] = c_purple;
AnchorView = true;
FlatBack_Colour = $ffeaff;

ShiftingTiles_MinRows = 8;
ShiftingTiles_MaxRows = 26;
ShiftingTiles_Columns = 60;
for ( var i=0 ; i<ShiftingTiles_Columns ; i++) {
	ShiftingTiles_ColumnHeight[i] = ShiftingTiles_MaxRows//irandom_range(ShiftingTiles_MinRows,ShiftingTiles_MaxRows-5);
	};
ShiftingTiles_AlphaFalloff = 0.10;
ShiftingTiles_AlphaClimb = 0.03;
ShiftingTiles_Backgrounding = true;
alarm[0] = 1; //Turn On Periodic Updates