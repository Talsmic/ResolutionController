///window_get_height_safe();
/*
	[PPC][Module:Resolution]
	The standard window_get_height function in GMS:2 returns 0 if the window gets 
	minimised. This is dangerous behaviour with a lot of ResolutionController 
	scripts, and this version will always output a value greater than zero
	>Returns {integer}: Window Height
*/
var output = window_get_height();
if ( output < 1 ) { output = PPRES_MinWindowHeight };
return output;