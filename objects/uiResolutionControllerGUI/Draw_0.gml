/// @desc Draw Screen Framing
var x1 = camera_get_view_x( view_camera[view_current] );
var x2 = x1 + resolution_get_width();
var y1 = camera_get_view_y( view_camera[view_current] );
var y2 = y1 + resolution_get_height();
var w = x2 - x1;
var h = y2 - y1;

if ( DrawFrame ) {
	draw_set_color(c_black);
	//Top Left
	draw_plane(x1+2,y1+2,10,2);
	draw_plane(x1+2,y1+2,2,10);
	//Top Right
	draw_plane(x2-12,y1+2,10,2);
	draw_plane(x2-4,y1+2,2,10);
	//Bottom Left
	draw_plane(x1+2,y2-4,10,2);
	draw_plane(x1+2,y2-12,2,10);
	//Bottom Right
	draw_plane(x2-12,y2-4,10,2);
	draw_plane(x2-4,y2-12,2,10);
	draw_set_font(ft_EvoTooltip_6_Bold);
	draw_text(x1+6,y1+5,string(x1)+", "+string(y1));
	draw_text(x1+6,y2-14,string(x1)+", "+string(y2));
	draw_set_halign(fa_right);
	draw_text(x2-5,y1+5,string(x2)+", "+string(y1));
	draw_text(x2-5,y2-14,string(x2)+", "+string(y2));
	draw_set_halign(fa_center);
	draw_text_transformed(x1+13,y1+(h div 2),string(h),1,1,270);
	draw_text_transformed(x2-4,y1+(h div 2),string(h),1,1,270);
	draw_text(x1+(w div 2),y1+5,string(w));
	draw_text(x1+(w div 2),y2-14,string(w));
	draw_set_halign(fa_left);
	};
