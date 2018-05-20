///ppres_setresolution_default();
/*
	[PPC][Module:Resolution]
	Creates all the variables that oResolutionController needs to function, 
	setting them to their defaults.
*/


Options_Fullscreen			= PPRES_Fullscreen_AtBoot;
Options_Magnification		= PPRES_Magnification_AtBoot;
Options_LockedMagnification = PPRES_Magnification_Lock;
Options_Vsync				= PPRES_VsyncAtBoot;
Options_ResolutionSnap		= PPRES_Magnification_RubberBanding; //Should the game snap resolution every frame?

Resolution_Magnification	= 3;

Resolution_CompleteWidth	= 480;
Resolution_CompleteHeight	= 270;
Resolution_PlayableWidth	= 480;
Resolution_PlayableHeight	= 270;
Resolution_PadWidth			= 0;
Resolution_PadHeight		= 0;
Resolution_ViewWidth		= 0;
Resolution_ViewHeight		= 0;
Resolution_GUIxOffset		= 0;
Resolution_GUIyOffset		= 0;
Resolution_MarginColour		= PPRES_MarginColours;
FloatingPixels_Width		= 0;
FloatingPixels_Height		= 0;

ResolutionSnapNextFrame = true; //Should the resolution snap at the next frame?
ResolutionCenterNextFrame = false;
ResolutionSnap_Magnification = Options_Magnification; //Default Zoom

Breakpoints_Width			= [0,0,0,0];
Breakpoints_Height			= [0,0,0,0];

/*=[Notes]======================================================================
	-	This function can be run at any time to reset a oResolutionController, 
		but make sure you run it through the instance of the object.
