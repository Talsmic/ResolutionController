///draw_array_vertical(x,y,array,[colour],[alpha],[spacing],[clipwidth]);
/// @arg x {real}
/// @arg y {real}
/// @arg array {array}
/// @arg [colour] {real}		(Defaults draw_get_colour();)
/// @arg [alpha] {real|0..1}		(Defaults draw_get_alpha();)
/// @arg [spacing] {real}		(default: 0)
/// @arg [clipwidth] {integer}	(default: 0)
var draw_x = argument[0];
var draw_y = argument[1];
var array = argument[2];
var colour = draw_get_colour();	if ( argument_count > 3 ) { colour = argument[3] };
var alpha = draw_get_alpha();	if ( argument_count > 4 ) { alpha = argument[4] };
var spacing = 0;				if ( argument_count > 5 ) { spacing = argument[5] };
var clipwidth = 0;				if ( argument_count > 6 ) { clipwidth = argument[6] };

//Find Spacing
if ( !spacing ) { spacing = string_height("|") };

//Draw
for ( var i=0 ; i<array_length_1d(array) ; i++ ) {
	if ( clipwidth ) { array[i] = string_clip(array[i],clipwidth,"..."); };
	draw_text_flatcolour(draw_x,draw_y,string(array[i]),colour,alpha);
	draw_y += spacing;
	};