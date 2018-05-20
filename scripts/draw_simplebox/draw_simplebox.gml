///draw_simplebox([x],[y],[width],[height],[colour],[alpha],[{corner_array}]);
/// @arg [x]				{real}
///	@arg [y]				{real}
/// @arg [width]			{real}
/// @arg [height]			{real}
///	@arg [colour]			{c_code}				(default: c_white)
/// @arg [alpha]			{real|0..1}				(default: 1)
/// @arg [corner_array]		{array|booleans}		(default: [0,0,0,0]}
/*
	>Returns a region of the ui box dimensions
	>Draws a ui box of [width],[height] at [x],[y], with optional sharp corners
	Uses the spr_plainbox_4x4 sprite
	Optionally, of [spriteset], [colour] and [alpha]
	
	Spritesets use the image_index format of:
		[1/10][   2   ][3/11]
		[ 4 ][    5    ][ 6 ]
		[7/12][   8   ][9/13]
*/
if ( argument_count > 0 ) { var draw_x = argument[0] }		 else { var draw_x = x };
if ( argument_count > 1 ) { var draw_y = argument[1] }		 else { var draw_y = y };
if ( argument_count > 2 ) { var width = argument[2] }		 else { var width = 100 };
if ( argument_count > 3 ) { var height = argument[3] }		 else { var height = 50 };
if ( argument_count > 4 ) { var colour = argument[4] }		 else { var colour = c_black };
if ( argument_count > 5 ) { var alpha = argument[5] }		 else { var alpha = 0.8 };
if ( argument_count > 6 ) { var corner_array = argument[6] } else { var corner_array = [0,0,0,0] };

draw_tilebox_sharp(draw_x,draw_y,width,height,colour,alpha,spr_plainbox_4x4,corner_array);

return [draw_x,draw_y,draw_x+width,draw_y+height,width,height];