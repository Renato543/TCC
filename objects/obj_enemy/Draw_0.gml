if(surface_exists(global.main_surface)) {
	surface_set_target(global.main_surface);
	camera_apply(view_camera[0]);
	if(!out_cam) {
		variation = 0;
		draw_sprite_ext(sprite_index, image_index, x, y + variation, xscale, yscale * -1, angle, image_blend, .6 * image_alpha);
		
		draw_sprite_ext(sprite_index, image_index, x, y + variation, xscale, yscale, angle, image_blend, image_alpha);

		if(light_alp > 0) { 
			shader_set(sh_dmgLight);
			draw_sprite_ext(sprite_index, image_index, x, y + variation, xscale, yscale, angle, c_white, light_alp * image_alpha);
			shader_reset();
		}
	}
	

	surface_reset_target();
}

	


