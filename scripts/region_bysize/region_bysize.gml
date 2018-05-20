///region_bysize(x,y,width,length);
/// @arg x		{real}
/// @arg y		{real}
/// @arg width	{real}
/// @arg height {real}
/*
	>Returns {array|integers} [x1,y1,x2,y2,width,height];
*/
var x1 = argument0;
var y1 = argument1;
var x2 = argument0 + argument2;
var y2 = argument1 + argument3;
var w = argument2;
var h = argument3;

var output = [x1,y1,x2,y2,w,h];

return output;