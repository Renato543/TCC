/// @description Background particles
// You can write your code in this editor

ps = part_system_create();
pt = part_type_create();
pe = part_emitter_create(ps);
part_system_automatic_draw(ps, false);

part_type_shape(pt, pt_shape_pixel);
part_type_size(pt, 1, 1, 0, 0);
part_type_scale(pt, 1, 1);
part_type_colour1(pt, c_white);
part_type_alpha3(pt, 0, .8, 0);
part_type_speed(pt, 0, .1, 0, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_gravity(pt, 0, 0);
part_type_orientation(pt, 0, 0, 0, 0, 0);
part_type_blend(pt, 0);
part_type_life(pt, 500, 2000);


function back_particles() { 


	var x1 = camera_get_view_x(view_camera[0]) - camera_get_view_width(view_camera[0]);
	var x2 = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) * 2;
	var y1 = camera_get_view_y(view_camera[0]) - camera_get_view_height(view_camera[0]); 
	var y2 = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) * 2; 
	//part_emitter_region(ps, pe, x1, x2, y1, y2, pt_shape_pixel, ps_distr_linear);
	//part_emitter_burst(ps, pe, pt, 1);	
	
	part_particles_create_color(ps, irandom_range(x1, x2), irandom_range(y1, y2), pt, choose(c_white, c_purple), 2);
	
}