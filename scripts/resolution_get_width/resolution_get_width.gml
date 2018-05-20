///resolution_get_width([type]);
/// @arg [type]
if ( argument_count > 0 ) { var type = argument[0] } else { var type = "Complete" };
var output = window_get_width();

 
if instance_exists(oResolutionController) {
	
	switch ( type ) {
	
		case "Complete":
			output = oResolutionController.Resolution_CompleteWidth;
			break;
			
		case "Playable":
			output = oResolutionController.Resolution_PlayableWidth;
			break;
			
		case "Padded":
			output = oResolutionController.Resolution_PadWidth;
			break;
			
		case "GUIOffset":
			output = oResolutionController.Resolution_GUIxOffset;
			break;
			
		case "FloatingPixels":
			output = oResolutionController.FloatingPixels_Width;
			break;
			
		case "View":
		case "Camera":
			output = oResolutionController.Resolution_ViewWidth;
			break;
			
		};
		
	}
else {
	
	switch ( type ) {
		
		case "Padded":
		case "GUIOffset":
		case "FloatingPixels":
			output = 0;
			break;
			
		case "View":
			output = view_get_wport(view_current);
			break;
			
		case "Camera":
			output = camera_get_view_x(view_camera[view_current]);
			break;
			
		};
		
	};
	
return output;
