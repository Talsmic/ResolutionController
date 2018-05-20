///guimouse_get_y();
/*
	[PPC][Module:Resolution]
	>Returns {integer}: Mouse y position on the GUI layer 
*/
var output = window_mouse_get_y(); //Default to the Window Position of the mouse

//If GUI Mouse tracking is enabled, divide by resolution_get_scale()
if ( instance_exists(oResolutionController) ) { output = output div resolution_get_scale() };

return output;


/*=[Notes]======================================================================
	-	This will produce a different result than window_mouse_get_y(), because
		it takes in to account both the scaling and gui offset the Resolution 
		Controller is applying.
	-	If you're not using oResolutionController,  window_mouse_get_y() will
		get you the number you need correctly.
