if(surface_exists(global.main_surface)) {
	surface_set_target(global.main_surface);
	camera_apply(view_camera[0]);
	for(var i = 0; i < array_length(circle_list); i++) {
		draw_circle(x, y, range * circle_list[i] * xscale, true);	
	}
	
	draw_sprite_ext(sprite_index, image_index, x + 1, y + sin(global.current_time * .002) * 3, xscale, yscale, image_angle + sin(global.current_time * .005) * 10, image_blend, image_alpha);
	surface_reset_target();
}