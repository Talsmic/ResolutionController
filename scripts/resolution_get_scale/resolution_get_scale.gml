///resolution_get_scale();
var output = window_get_width_safe() div view_get_wport(view_current);
 
if instance_exists(oResolutionController) {
	
	output = oResolutionController.Resolution_Magnification;
		
	};
	
return output;
