///draw_tilebox(x,y,width,height,[colour],[alpha],[spriteset]);
/// @arg x				{real}
///	@arg y				{real}
/// @arg width			{real}
/// @arg height			{real}
///	@arg [colour]		{c_code}				(default: draw_get_color())
/// @arg [alpha]		{real|0..1}				(default: draw_get_alpha())
/// @arg [spriteset]	{integer|Sprite_ID}		(default: spr_tilebox_4x4)
/*
	>Draws a ui box of [width],[height] at [x],[y]
	Optionally, of [spriteset], [colour] and [alpha]
	
	Spritesets use the image_index format of:
		[ 1 ][   2   ][ 3 ]
		[ 4 ][   5   ][ 6 ]
		[ 7 ][   8   ][ 9 ]
*/
if ( argument_count < 4 ) { show_debug_message("draw_tilebox() requires >=4 arguments, got "+string(argument_count)); exit };
var draw_x = argument[0]; 
var draw_y = argument[1];
var width = argument[2]; 
var height = argument[3];
if ( argument_count > 4 ) { var colour = argument[4] }		else { var colour = draw_get_color() };
if ( argument_count > 5 ) { var alpha = argument[5] }		else { var alpha = draw_get_alpha() };
if ( argument_count > 6 ) { var spriteset = argument[6] }	else { var spriteset = spr_plainbox_4x4 };

//Find Tile Sizes
var tw = sprite_get_width( spriteset );
var th = sprite_get_width( spriteset );
//Find Body Size
var bw = width - tw * 2;
var bh = height - th * 2;
//Enlarge Undersized Boxes to avoid graphical errors
if ( bw < 0 ) { bw = 0; width = tw * 2 };
if ( bh < 0 ) { bh = 0; height = th * 2 };

//Draw 
//Top Left Corner [Frame 1]
draw_sprite_ext				(spriteset,	1,	draw_x,			draw_y,			1,1,0,	colour,	alpha);
//Top Border [Frame 2]
draw_sprite_stretched_ext	(spriteset,	2,	draw_x+tw,		draw_y,			bw,th,	colour,	alpha);
//Top Right Corner [Frame 3]
draw_sprite_ext				(spriteset,	3,	draw_x+tw+bw,	draw_y,			1,1,0,	colour,	alpha);
//Left Border [Frame 4]
draw_sprite_stretched_ext	(spriteset,	4,	draw_x,			draw_y+th,		tw,bh,	colour,	alpha);
//Body [Frame 5]
draw_sprite_stretched_ext	(spriteset,	5,	draw_x+tw,		draw_y+th,		bw,bh,	colour,	alpha);
//Right Border [Frame 6]
draw_sprite_stretched_ext	(spriteset,	6,	draw_x+tw+bw,	draw_y+th,		tw,bh,	colour,	alpha);
//Bottom Left Corner [Frame 7]
draw_sprite_ext				(spriteset,	7,	draw_x,			draw_y+th+bh,	1,1,0,	colour,	alpha);
//Bottom Border [Frame 8]
draw_sprite_stretched_ext	(spriteset,	8,	draw_x+tw,		draw_y+th+bh,	bw,th,	colour,	alpha);
//Bottom Right Corner [Frame 9]
draw_sprite_ext				(spriteset,	9,	draw_x+tw+bw,	draw_y+th+bh,	1,1,0,	colour,	alpha);


