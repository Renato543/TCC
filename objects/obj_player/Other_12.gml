/// @description Revive particle
// You can write your code in this editor

ps = part_system_create();
part_system_automatic_draw(ps, false);
pt = part_type_create();

part_type_shape(pt, pt_shape_pixel);
part_type_size(pt, 1, 1, 0, 0);
part_type_scale(pt, 1, 1);
part_type_colour1(pt, c_white);
part_type_alpha3(pt, 1, 1, 1);
part_type_speed(pt, .5 * 3, 2 * 3, -.1, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_gravity(pt, 0, 0);
part_type_orientation(pt, 270, 270, 0, 0, 0);
part_type_blend(pt, 0);
part_type_life(pt, 10, 50);
	


