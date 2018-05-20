/// @desc Draw DataBoxes
/*VisibleCheck*/if ( Hidden ) { return };

ui_DataBox_ResolutionControllerMacros(GUI_X,GUI_Y);
LastDrawWidth = ui_ListBackground_get_width();
LastDrawHeight = ui_ListBackground_get_height();
ui_DataBox_SettingsResolution(GUI_X,GUI_Y+LastDrawHeight+4);
LastDrawHeight += ui_ListBackground_get_height() + 4;
ui_DataBox_ResolutionControllerLocal(GUI_X,GUI_Y+LastDrawHeight+4);
ui_DataBox_Window(GUI_X+LastDrawWidth+4,GUI_Y+LastDrawHeight+4);

ui_DataBox_ResolutionControllerBreakPoints(GUI_X+LastDrawWidth+4,GUI_Y);
LastDrawWidth += ui_ListBackground_get_width() + 4;
ui_DataBox_ResolutionControllerIdealPoints(GUI_X+LastDrawWidth+4,GUI_Y);
LastDrawWidth += ui_ListBackground_get_width() + 4;