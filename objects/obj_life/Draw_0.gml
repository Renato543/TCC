if(surface_exists(global.main_surface)) { 
	surface_set_target(global.main_surface);
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
	surface_reset_target();
}