if(surface_exists(global.main_surface)) {
	surface_set_target(global.main_surface);
	camera_apply(view_camera[0]);
	draw_set_config(global.font, color, alpha);
	if(heal) draw_text_transformed(x, y, round(heal_number), xscale, yscale, 0);
	else draw_text_transformed(x, y, round(damage * my_base_damage), xscale, yscale, 0);
	draw_reset_config();
	surface_reset_target();

}