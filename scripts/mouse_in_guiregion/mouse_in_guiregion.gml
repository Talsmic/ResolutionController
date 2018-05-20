///mouse_in_guiregion(region);
/// @arg region {array|integers} [x1,y1,x2,y2];
/*
	>Returns {Boolean}
*/
var region = argument0;

if ( point_in_rectangle( global.GUI_MouseX, global.GUI_MouseY, region[0], region[1], region[2], region[3] ) ) {
	return true;
	};
	
return false;