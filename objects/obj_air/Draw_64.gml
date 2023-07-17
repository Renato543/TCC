if(surface_exists(obj_game.my_surf)) {
	//surface_set_target(obj_game.my_surf);
	variation = 0;
	if(my_vspeed > .1) var variation = sin(rad * sin_vel) * sin_str;
	
	var anxiety_shake_x = obj_game.anxiety_level * irandom_range(-1.5, 1.5);
	var anxiety_shake_y = obj_game.anxiety_level * irandom_range(-1.5, 1.5);
	draw_sprite_ext(sprite_index, image_index, my_x + variation + anxiety_shake_x, my_y + anxiety_shake_y, xscale * size, yscale * size, image_angle, image_blend, size/1);
	//surface_reset_target();
}


