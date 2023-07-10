if(surface_exists(global.main_surface)) { 
	surface_set_target(global.main_surface);
	camera_apply(view_camera[0]);
	var final_xscale = xscale;
	var final_yscale = yscale;
	
	draw_sprite_ext(sprite_index, image_index, x, y, final_xscale, final_yscale, image_angle, image_blend, image_alpha);
	surface_reset_target();
}