if(surface_exists(global.main_surface)) {
	surface_set_target(global.main_surface);
	camera_apply(view_camera[0]);
	part_system_drawit(ps);
	surface_reset_target();
}