///window_get_width_safe();
/*
	[PPC][Module:Resolution]
	The standard window_get_width function in GMS:2 returns 0 if the window gets 
	minimised. This is dangerous behaviour with a lot of ResolutionController 
	scripts, and this version will always output a value greater than zero
	>Returns {integer}: Window Width
*/
var output = window_get_width();
if ( output < 1 ) { output = PPRES_MinWindowWidth };
return output;
