if(surface_exists(global.main_surface)) {
	surface_set_target(global.main_surface);
	camera_apply(view_camera[0]);
	draw_sprite_ext(sprite_index, image_index, x, y, xscale * main_scale, yscale * main_scale, dir, image_blend, image_alpha);

	if(!main && instance_exists(dad)) {
		draw_line_width_color(x, y, dad.x, dad.y, 2, make_color_rgb(130, 53, 255), make_color_rgb(130, 53, 255));
	}	
	
	if(light_alp > 0) { 
		shader_set(sh_dmgLight);
		draw_sprite_ext(sprite_index, image_index, x, y, xscale * main_scale, yscale * main_scale, dir, c_white, light_alp);
		shader_reset();
	}
	
	surface_reset_target();
}