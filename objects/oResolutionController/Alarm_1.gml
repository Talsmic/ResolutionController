/// @desc Resolution Correction

//Correct Resolution
if ( Options_ResolutionSnap ) { ResolutionSnapNextFrame = true };
ppres_adapt_resolution();

//Refresh next step if required
if ( ResolutionSnapNextFrame or ResolutionCenterNextFrame ) {
	alarm[1] = 1;
	return;
	};

//Resume normal refresh rate, if enabled
if ( PPRES_RefreshRate > 0 ) {
	alarm[1] = PPRES_RefreshRate;
	return;
	};
	