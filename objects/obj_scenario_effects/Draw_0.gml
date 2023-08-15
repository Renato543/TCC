
//draw_sprite_ext(spr_vignette, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1, 1, 0, c_white, .7);
	
if(surface_exists(global.main_surface)) { 
	surface_set_target(global.main_surface);
	camera_apply(view_camera[0]);

	part_system_drawit(ps);
	surface_reset_target();
}
