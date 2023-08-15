xx = camera_get_view_x(view_camera[0]);
yy = camera_get_view_y(view_camera[0]);

if(!surface_exists(my_surf)) { 
	my_surf = surface_create(camera_get_view_width(view_camera[0]),  camera_get_view_height(view_camera[0]));
	surface_set_target(my_surf);
	surface_reset_target();
}
else { 
	draw_surface(my_surf, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));	
	surface_set_target(my_surf);
	draw_clear_alpha(0, 0);
	surface_reset_target();
}

if(surface_exists(my_surf)) {
	
	surface_set_target(my_surf);
	camera_apply(view_camera[0]);
	
	if(boss) { 
		hue += 2;
		if(hue >= 255) hue = 0;
		color = make_color_hsv(hue, 50, 255);	
		draw_shader_outline(,, true, color, x, y, image_xscale, image_yscale);	
	}
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha); 
	if(light_alp > 0) { 
		shader_set(sh_dmgLight);
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, light_alp); 
		shader_reset();
	}
	
	surface_reset_target();
}