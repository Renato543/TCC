if(surface_exists(global.main_surface)) {
	surface_set_target(global.main_surface);
	camera_apply(view_camera[0]);
	
	var alp = .5;
	
	//(state == player_states.desintegration && round(image_index) >= 24) alp = 0;
	
	var shake_x = random_range(-player_shake * obj_game.anxiety_level, player_shake * obj_game.anxiety_level);
	var shake_y = random_range(-player_shake * obj_game.anxiety_level, player_shake * obj_game.anxiety_level);
	
	if(state == player_states.reviving) {
		shader_set(sh_brightness);
		shader_set_uniform_f(u_brightness, reviving_load);
	}
	
	draw_sprite_ext(sprite_index, image_index, x + shake_x, y + variation + shake_y, xscale, yscale * -1, image_angle, image_blend, .6);
	
	draw_sprite_ext(sprite_index, image_index, x + shake_x, y + variation + shake_y, xscale, yscale, image_angle, image_blend, image_alpha);

	shader_reset();

	if(light_alp > 0) { 
		shader_set(sh_dmgLight);
		draw_sprite_ext(sprite_index, image_index, x + shake_x, y + variation + shake_y, xscale, yscale, image_angle, image_blend, light_alp);	
		shader_reset();
	}
	
	part_system_drawit(ps);
	
	surface_reset_target();
}

