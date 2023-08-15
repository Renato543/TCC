if(surface_exists(global.main_surface)) {	
	surface_set_target(global.main_surface);
	camera_apply(view_camera[0]);
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, angle, image_blend, image_alpha);
	surface_reset_target();
}