if(surface_exists(global.main_surface)) { 
	surface_set_target(global.main_surface);
	camera_apply(view_camera[0]);
	draw_self();
	surface_reset_target();
}