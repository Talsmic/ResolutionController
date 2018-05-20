///mouse_in_region(region);
/// @arg region {array|integers} [x1,y1,x2,y2,width,height];
/*
	>Returns {Boolean}
*/
var region = argument0;

if ( point_in_rectangle( mouse_x, mouse_y, region[1], region[2], region[3], region[4] ) ) {
	return true;
	};
	
return false;