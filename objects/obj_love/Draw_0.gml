surf_ww = camera_get_view_width(view_camera[0]);
surf_hh = camera_get_view_height(view_camera[0]);

if(surface_exists(global.main_surface)) { 
	surface_set_target(global.main_surface);
	camera_apply(view_camera[0]);
	part_system_drawit(ps);
	part_system_drawit(ps2);
	
	var diff_x = x;
	var xx = diff_x;
	var diff_y = y;
	var yy = diff_y;
	
	draw_sprite_ext(sprite_index, image_index, xx, yy, xscale, yscale, angle, image_blend, image_alpha);	
	surface_reset_target();
	
}







