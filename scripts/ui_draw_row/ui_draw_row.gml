///ui_draw_row([x],[y],[columns],[columnsize],[rowsize],[spacing],[colour],[alpha],[mouseovers]);
/// @arg [x] {real}						(default: 0)
/// @arg [y] {real}						(default: 0)
/// @arg [columns] {integer}			(default: 1)
/// @arg [columnsize] {array|integers}	(default: 30)
/// @arg [rowsize] {integer}			(default: 10)
/// @arg [spacing] {integer}			(default: 1)
/// @arg [colour] {c_code}				(default: c_white)
/// @arg [alpha] {real|0..1}				(default: 0.2)
/// @arg [mouseovers] {boolean+}		(default: false)
var draw_x = 0;
var draw_y = 0;
var columns = 1;
var width;
var height = 10;
var spacing = 1;
var colour = c_white;
var alpha = 0.2;
var mouseovers = false;
if ( argument_count > 0 ) { draw_x = argument[0] };
if ( argument_count > 1 ) { draw_y = argument[1] };
if ( argument_count > 2 ) { columns = argument[2] };
if ( argument_count > 3 ) { width = argument[3] };
					 else { width = array_create(columns+1,30) }
if ( argument_count > 4 ) { height = argument[4] };
if ( argument_count > 5 ) { spacing = argument[5] };
if ( argument_count > 6 ) { colour = argument[6] };
if ( argument_count > 7 ) { alpha = argument[7] };
if ( argument_count > 8 ) { mouseovers = argument[8] };


for ( var i=1 ; i<=columns ; i++ ) {
	draw_plane(draw_x,draw_y,width[i],height,colour,alpha);
	if ( mouseovers == 1 and mouse_in_region([draw_x,draw_y,draw_x+width[i],draw_y+height]) ) {
		draw_plane(draw_x,draw_y,width[i],height,c_white,alpha);
		};
	if ( mouseovers == 2 and mouse_in_guiregion([draw_x,draw_y,draw_x+width[i],draw_y+height]) ) {
		draw_plane(draw_x,draw_y,width[i],height,c_white,alpha);
		};
	draw_x += width[i] + spacing;
	};