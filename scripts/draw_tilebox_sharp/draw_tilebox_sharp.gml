///draw_tilebox_sharp(x,y,width,height,[colour],[alpha],[spriteset],[{corner_array}]);
/// @arg x					{real}
///	@arg y					{real}
/// @arg width				{real}
/// @arg height				{real}
///	@arg [colour]			{c_code}				(default: c_white)
/// @arg [alpha]			{real|0..1}				(default: 1)
/// @arg [spriteset]		{integer|Sprite_ID}		(default: spr_tilebox_4x4)
/// @arg [corner_array]		{array|booleans}		(default: [1,1,1,1]}
/*
	>Draws a ui box of [width],[height] at [x],[y], with optional sharp corners
	Optionally, of [spriteset], [colour] and [alpha]
	
	Spritesets use the image_index format of:
		[1/10][   2   ][3/11]
		[ 4 ][    5    ][ 6 ]
		[7/12][   8   ][9/13]
*/
if ( argument_count < 4 ) { show_debug_message("draw_tilebox_sharp() requires >=4 arguments, got "+string(argument_count)); exit };
var draw_x = argument[0]; 
var draw_y = argument[1];
var width = argument[2]; 
var height = argument[3];
if ( argument_count > 4 ) { var colour = argument[4] }		else { var colour = draw_get_color() };
if ( argument_count > 5 ) { var alpha = argument[5] }		else { var alpha = draw_get_alpha() };
if ( argument_count > 6 ) { var spriteset = argument[6] }	 else { var spriteset = spr_plainbox_4x4 };
if ( argument_count > 7 ) { var corner_array = argument[7] } else { var corner_array = [1,1,1,1] };

//Make sure corner_array is long enough
switch array_length_1d(corner_array) { 
	case 0: corner_array[0] = 1;  case 1: corner_array[1] = 1; 
	case 2: corner_array[2] = 1;  case 3: corner_array[3] = 1 };
//Assign correct corner sprites
var corner = [1,3,7,9] ;
if ( corner_array[0] ) { corner[0] = 10 };
if ( corner_array[1] ) { corner[1] = 11 };
if ( corner_array[2] ) { corner[2] = 12 };
if ( corner_array[3] ) { corner[3] = 13 };

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
draw_sprite_ext				(spriteset,	corner[0],	draw_x,			draw_y,			1,1,0,	colour,	alpha);
//Top Border [Frame 2]
draw_sprite_stretched_ext	(spriteset,	2,			draw_x+tw,		draw_y,			bw,th,	colour,	alpha);
//Top Right Corner [Frame 3]
draw_sprite_ext				(spriteset,	corner[1],	draw_x+tw+bw,	draw_y,			1,1,0,	colour,	alpha);
//Left Border [Frame 4]
draw_sprite_stretched_ext	(spriteset,	4,			draw_x,			draw_y+th,		tw,bh,	colour,	alpha);
//Body [Frame 5]
draw_sprite_stretched_ext	(spriteset,	5,			draw_x+tw,		draw_y+th,		bw,bh,	colour,	alpha);
//Right Border [Frame 6]
draw_sprite_stretched_ext	(spriteset,	6,			draw_x+tw+bw,	draw_y+th,		tw,bh,	colour,	alpha);
//Bottom Left Corner [Frame 7]
draw_sprite_ext				(spriteset,	corner[2],	draw_x,			draw_y+th+bh,	1,1,0,	colour,	alpha);
//Bottom Border [Frame 8]
draw_sprite_stretched_ext	(spriteset,	8,			draw_x+tw,		draw_y+th+bh,	bw,th,	colour,	alpha);
//Bottom Right Corner [Frame 9]
draw_sprite_ext				(spriteset,	corner[3],	draw_x+tw+bw,	draw_y+th+bh,	1,1,0,	colour,	alpha);

