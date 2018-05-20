// Inherit the parent event
event_inherited();
FlatBack = false;

Grid_Size = 32; //8, 16, 24 or 32
Grid_Colour = c_white;
Grid_Shading = 0; //0 for light, 1 for dark
Grid_Alpha = 0.5;
Grid_Layer = 0; //0 for Standard, 1 for GUI
Grid_Draw_CoOrds = false;
Grid_SquaresX = -1; //-1 for infinite
Grid_SquaresY = -1; //-1 for infinite

BG_Tile[1,UP] =		false;
BG_Tile[1,DOWN] =	true;
BG_Tile[1,LEFT] =	false;
BG_Tile[1,RIGHT] =	true;
BG_Tile[1,5] = true; //fill

BG_AnchorH[1] = -1;
BG_AnchorV[1] = -1;