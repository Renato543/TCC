/// @description Particle
// You can write your code in this editor

part_type_sprite(obj_candy_control.pt, sprite_index, false, false, false);
part_type_size(obj_candy_control.pt, 1, 1, -.05, 0);
part_type_scale(obj_candy_control.pt, xscale, yscale);
part_type_colour1(obj_candy_control.pt, c_white);
part_type_alpha3(obj_candy_control.pt, 1, .5, 0);
part_type_speed(obj_candy_control.pt, 0, 0, 0, 0);
part_type_direction(obj_candy_control.pt, 0, 0, 0, 0);
part_type_gravity(obj_candy_control.pt, 0, 90);
part_type_orientation(obj_candy_control.pt, angle, angle, 0, 0, true);
part_type_blend(obj_candy_control.pt, 0);
part_type_life(obj_candy_control.pt, 0, 200);

part_emitter_region(obj_candy_control.ps, obj_candy_control.pe, x, x, y, y, pt_shape_pixel, ps_distr_linear);
part_emitter_burst(obj_candy_control.ps, obj_candy_control.pe, obj_candy_control.pt, 1);	