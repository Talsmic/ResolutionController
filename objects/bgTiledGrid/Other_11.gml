/// @desc Draw Grid Cell

//Check Square Counts (-1 infinte)
if ( Grid_SquaresX >= 0 ) {
	if ( DrawIDX > Grid_SquaresX ) { return }
	if ( DrawIDX < -Grid_SquaresX ) { return }
	};
if ( Grid_SquaresY >= 0 ) {
	if ( DrawIDY < -Grid_SquaresY ) { return }
	if ( DrawIDY > Grid_SquaresY ) { return }
	};
//Draw Cell
draw_sprite_ext( BG_Sprite[bgid], BG_Frame[bgid], DrawX, DrawY, BG_ScaleX[bgid], BG_ScaleY[bgid], 0, BG_Tint[bgid], BG_Alpha[bgid]);
//Draw Text
if ( Grid_Draw_CoOrds and Grid_Size > 8 ) {
	draw_set_font(ft_EvoTooltip_6_Condensed);
	draw_set_halign(fa_right);
	var text_x = DrawX + (sprite_get_width(BG_Sprite[bgid])*BG_ScaleX[bgid]) - 1;
	var text_y = DrawY + (sprite_get_height(BG_Sprite[bgid])*BG_ScaleY[bgid]) - 10;
	draw_text_outline( text_x, text_y, string(DrawIDX)+","+string(-DrawIDY), BG_Tint[bgid]);
	draw_set_halign(fa_left);
	};