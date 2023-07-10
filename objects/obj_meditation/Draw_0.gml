if(surface_exists(global.main_surface)) { 
	surface_set_target(global.main_surface);	
	camera_apply(view_camera[0]);
	draw_set_color(color_id > 0 ? make_color_rgb(225, 139, 215): make_color_rgb(196, 233, 233));
	draw_set_alpha(.8);
	draw_circle(x, y, radius + random_range(-5, 5), true);
	draw_circle(x, y, (radius - 1) + random_range(-5, 5), true);
	draw_set_color(-1);
	part_system_drawit(ps);

	surface_reset_target();
}