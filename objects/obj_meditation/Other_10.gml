/// @description Shock particle
// You can write your code in this editor
//repeat(10) {
//	part_system_depth(ps, depth - 1);
//	part_type_shape(pt, pt_shape_pixel);
//	part_type_size(pt, 1, 1, 0, 0);
//	part_type_scale(pt, 2, 1);
//	part_type_colour1(pt, make_color_rgb(196, 233, 233));
//	part_type_alpha1(pt, .8);
//	part_type_speed(pt, .1, .5, 0, 0);
//	part_type_direction(pt, 0, 360, 0, 0);
//	part_type_gravity(pt, 0, 0);
//	part_type_orientation(pt, 45, 45, 0, 0, 0);
//	part_type_blend(pt, 0);
//	part_type_life(pt, 0, 20);


//	var ang = irandom(360);
//	var xx = x + lengthdir_x(radius, ang);
//	var yy = y + lengthdir_y(radius, ang);
//	part_emitter_region(ps, pe, xx, xx, yy, yy, pt_shape_pixel, ps_distr_linear);
//	part_emitter_burst(ps, pe, pt, 1);
//}
