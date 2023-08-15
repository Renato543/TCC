if(!surface_exists(global.main_surface)) { 
	global.main_surface = surface_create(camera_get_view_width(view_camera[0]),  camera_get_view_height(view_camera[0]));
	surface_set_target(global.main_surface);
	surface_reset_target();
}
else { 
	//draw_surface_stretched(night_surf, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
	//surface_resize(global.main_surface, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
	//draw_surface_ext(global.main_surface, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), 1, -1, 0, c_white, .2);	
	draw_surface(global.main_surface, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));	
	surface_set_target(global.main_surface);
	draw_clear_alpha(0, 0);
	surface_reset_target();
}


