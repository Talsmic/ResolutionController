///ppres_
/*
===[Overview]===================================================================
	The Pixel Powered Resolution Module is a powerful but unintrusive controller
	for pixel perfect resolution scaling with resizable windows and scalable 
	viewports and magnification.
	
	It's easy to set up (follow the Quick Setup guide below) and has a huge 
	amount of customisation you can play with by altering the macros in this 
	script.
	
	If you encounter any issues and need support, contact me dirtectly or post 
	on the marketplace page. I'm happy to solve any issues as they arise, and to
	add any features you might need!
	
		~Tals
		talsmic@gmail.com
	
===[Quick Setup]================================================================
	The first time you use any package like this, you should add the whole 
	package to a new GameMakerStudio project and compile to see how it works 
	before attempting to add it to your project. 
	I've included a test room and some debug tools that let you play around with 
	it and get an understanding of the tools involved.
	
	Once you've done that, you probably want to add this to an existing project.

	Add to your project (These should all be in the install package):
	  -	Everything in the Module Components section at the bottom of this document
	  - Everything in the Dependancies section at the bottom of this document
	
	In the Options for Windows:
		Graphics:
		  -	Display cursor: [Off]
		  -	Allow fullscreen switching: [Off]
		  -	Interpolate colours between pixels: [Off]
		  -	Allow window resize: [On]
		  - Scaling: [Keep aspect ratio]
		  
	If you want settings.ini to influence the game, make sure an 
	oSettingsContainer is created at the start of your game.
	Make sure an oResolutionController is created at the start of your game,
	after the settings container. 
	(Both are persistant and only need to be created once)

	Everything should work correctly at this point, and the oResolutionController
	should take over resolution management and drawing the Application Surface.
	
	Tweak the settings below to get your desired results.
	
===[Settings]===================================================================
---[Core Systems]-------------------------------------------------------------*/
	//Enable/Disable the entire Resolution module
	#macro PPRES_OnIntitialise			true
	//Enable/Disable GUI Mouse tracking corrections
	#macro PPRES_GUIMouse				true
	//Enable/Disable Cursor graphics
	#macro PPRES_Cursor  				true
	//[PLEASE LEAVE THIS ENABLED UNLESS YOU ARE AN ADVANCED USER]
	//When this is enabled, the oResolutionController will sieze control of 
	//responsibility for drawing the all important Application Surface.
	//By default, GMS:2 handle this itself, but many features of this addon 
	//require slight adjustments to its drawing.
	//If you are already controlling the drawing of the surface you may want to 
	//disable this. If you do, please look at the adjustments the function
	//ppres_draw_gamesurface(); makes and account for them in your own code.
	#macro PPRES_AppSurfaceHijack		true	
	
/*--[Refresh Triggers]--------------------------------------------------------*/
	//How often the controller adapts resolution sizes
	//Set to 0 to disable periodic adjustion to just rely on window size triggers,
	//beware this can cause failures to adapt.
	#macro PPRES_RefreshRate 			60 //every X steps
	//Enable/Disable to check every step for window size changes and force an
	//adapt resolution trigger
	#macro PPRES_RefreshOnWindowResize	true
	
/*--[Resolution Sizes]--------------------------------------------------------*/	
	//Ideal Width & Height is the resolution your game is designed to use
	#macro PPRES_IdealWidth				384 //pixels
	#macro PPRES_IdealHeight			288 //pixels
	//Minimums before scaling is shifted
	#macro PPRES_MinWidth				192 //pixels
	#macro PPRES_MinHeight				192 //pixels
	//Maximum screen sizes before margins are added
	//If these are 0 or below, there is no maximum screen size
	#macro PPRES_MaxWidth				960 //pixels
	#macro PPRES_MaxHeight				960 //pixels
	//Minimum window can be resized to
	// -1 to disable any minimum window sizing
	#macro PPRES_MinWindowWidth			384 //pixels
	#macro PPRES_MinWindowHeight		288 //pixels
	
/*--[GUI Layer]---------------------------------------------------------------*/	
	//Set PPRES_GUIScaling to 0 or below to enable adaptable GUI scaling, 
	//forcing it to match the resolution magnification level
	//Otherwise, PPRES_GUIScaling is the fixed scaling of the GUI layer, 
	//if you want it to always have a fixed magnification [NOT RECOMMENDED] 
	#macro PPRES_GUIScaling				0 //adaptable enabled
	//Enable this to lock the GUI layer inside the margins
	#macro PPRES_GUISnap				false
	
/*--[Other Settings]----------------------------------------------------------*/
	//Enable/Disable fullscreen toggling with Shift+Enter.
	//You should disable fullscreen switching in the GameMaker options and only
	//rely on this setting. You can customise the key combo to toggle fullscreen
	//with the key+mod combo
	#macro PPRES_Fullscreen_ToggleEnable	true
	#macro PPRES_Fullscreen_ToggleKey		vk_enter 
	#macro PPRES_Fullscreen_ToggleModifier	vk_alt // 0 to disable
	//Should the game boot in fullscreen mode?
	#macro PPRES_Fullscreen_AtBoot			false
	//What magnification level should the game boot with?
	#macro PPRES_Magnification_AtBoot		2		
	//The range of scalings the controller can access
	#macro PPRES_Magnification_Min			1 //Minimum 1		
	#macro PPRES_Magnification_Max			6		
	//Enable/Disable players to change magnfication level by scaling the screen
	#macro PPRES_Magnification_Lock			false	
	//Enable/Disable if the resolution always attempts to snap to an ideal
	//after a player has adjusted it
	#macro PPRES_Magnification_RubberBanding	false	
	//Enable/Disable vsync
	#macro PPRES_VsyncAtBoot				false
	//Margin Colours
	#macro PPRES_MarginColours				c_gray //colourcode

/*=[Module Components]==========================================================
---[Objects]--------------------------------------------------------------------
	oResolutionController							[Functional and Documented]
	
---[Scripts]--------------------------------------------------------------------
	ppres_setresolution_default([0]);				[Functional and Documented]
	ppres_adapt_resolution();						[Functional and Documented]
	ppres_flex_view([0],[1]);						[Functional and Documented]
	ppres_room_anchors([0]);						[Functional and Documented]
	ppres_draw_gamesurface();						[Undocumented]
	guimouse_get_[x/y]();							[Functional and Documented]
	window_get_[width/height]_safe();				[Functional and Documented]
		
===[Dependancies (included)]====================================================
---[Scripts]--------------------------------------------------------------------
	toggle()
---[Sprites]--------------------------------------------------------------------
	spr_cursor
	spr_cursor_x2
	spr_cursor_x3
	spr_cursor_x4
	spr_cursor_x5
---[Macros]---------------------------------------------------------------------
	PPSETTINGS_Enable
