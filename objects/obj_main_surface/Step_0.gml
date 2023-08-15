depth = obj_player.depth - 10000000;

if(surface_exists(global.main_surface)) {
	if(surface_get_width(global.main_surface) != camera_get_view_width(view_camera[0]) || surface_get_height(global.main_surface) != camera_get_view_height(view_camera[0])) { 
		surface_resize(global.main_surface, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]))	
	}
}