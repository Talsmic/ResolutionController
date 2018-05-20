///ui_saveregions_column([x],[y],[rows],[columnsize],[rowsize],[spacing]);
/// @arg [x] {real}						(default: 0)
/// @arg [y] {real}						(default: 0)
/// @arg [rows] {integer}				(default: 1)
/// @arg [columnsize] {integer}			(default: 30)
/// @arg [rowsize] {array|integers}		(default: 10)
/// @arg [spacing] {integer}			(default: 1)
/*
	>Returns {array|array|regions}
*/
var draw_x = 0;
var draw_y = 0;
var rows = 1;
var width = 30;
var height;
var spacing = 1;
if ( argument_count > 0 ) { draw_x = argument[0] };
if ( argument_count > 1 ) { draw_y = argument[1] };
if ( argument_count > 2 ) { rows = argument[2] };
if ( argument_count > 3 ) { width = argument[3] };
if ( argument_count > 4 ) { height = argument[4] };
					 else { height = array_create(rows+1,10) }
if ( argument_count > 5 ) { spacing = argument[5] };

if ( !rows ) { return 0 };

var output;

for ( var i=1 ; i<=rows ; i++ ) {
	output[i] = region_bysize(draw_x,draw_y,width,height[i]);
	draw_y += height[i] + spacing;
	};
	
return output;