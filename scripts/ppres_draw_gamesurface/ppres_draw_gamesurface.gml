///ppres_draw_gamesurface();

//Pull Variables
var surface_width = Resolution_PlayableWidth;
var surface_height = Resolution_PlayableHeight;
var scale = Resolution_Magnification;
var window_width = window_get_width_safe();
var window_height = window_get_height_safe();
var pad_w = floor( ( window_width - surface_width * scale ) * 0.5 );
var pad_h = floor( ( window_height - surface_height * scale ) * 0.5 );

//Draw Flat Colour
var surface = surface_create( 1, 1 );
surface_set_target( surface );
	draw_rectangle_colour(0,0,1,1,Resolution_MarginColour,Resolution_MarginColour,Resolution_MarginColour,Resolution_MarginColour,false);
surface_reset_target();
draw_surface_stretched( surface, 0, 0, window_width, window_height );
surface_free( surface );

//Draw Application Surface
if ( !surface_exists(application_surface) ) { show_debug_message("Error: Application Surface Not Found") }
else {
	surface_resize( application_surface, Resolution_PlayableWidth, Resolution_PlayableHeight );
	draw_surface_general( application_surface, 0, 0, surface_width, surface_height, pad_w, pad_h, scale, scale, 0, c_white, c_white, c_white, c_white, 1);
	};
