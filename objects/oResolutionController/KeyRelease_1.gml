///Fullscreen Toggle Check
//Fullscreen toggling, enabled with PPRES_Fullscreen_ToggleEnable
//Activated when PPRES_Fullscreen_ToggleKey	is released, while 
//PPRES_Fullscreen_ToggleModifier is held down.

if PPRES_Fullscreen_ToggleEnable {			//Checking enabled?
	if PPRES_Fullscreen_ToggleModifier {	//Is a modifer required?
		//Check for key release + modifer held
		if ( keyboard_check_released(PPRES_Fullscreen_ToggleKey) and keyboard_check(PPRES_Fullscreen_ToggleModifier) ) {
			show_debug_message("Fullscreen Input Recognised");
			Options_Fullscreen = toggle(Options_Fullscreen);
			event_perform(ev_alarm,1); //call the Resolution Correction event
			};
		}
	else {
		//Just check key release
		if ( keyboard_check_released(PPRES_Fullscreen_ToggleKey) ) {
			show_debug_message("Fullscreen Input Recognised");
			Options_Fullscreen = toggle(Options_Fullscreen);
			event_perform(ev_alarm,1); //call the Resolution Correction event
			};
		};
	};
		