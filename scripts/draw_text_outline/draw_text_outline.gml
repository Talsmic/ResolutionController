///draw_text_outline(x,y,string,colour);
/// @arg x			
/// @arg y
/// @arg string		
/// @arg colour
/*
	[Edited 11/5/2017]
	Draws text with a black 1px outline
*/
var olX = argument0; 
var olY = argument1; 
var ol_string = argument2; 
var colour = argument3;
var ol_colour = c_black;

draw_set_colour(ol_colour);
draw_text(olX+1,olY,ol_string);
draw_text(olX+1,olY+1,ol_string);
draw_text(olX-1,olY,ol_string);
draw_text(olX-1,olY+1,ol_string);
draw_text(olX,olY+1,ol_string);
draw_text(olX,olY-1,ol_string);
draw_set_colour(colour);
draw_text(olX,olY,ol_string);
