pt = part_type_create();

part_type_sprite(pt, sprite_index, false, false, false);
part_type_size(pt, 1, 1, 0, 0);
part_type_scale(pt, 1, 1);
part_type_colour1(pt, c_white);
part_type_alpha3(pt, 1, .5, 0);
part_type_speed(pt, 0, 0, 0, 0);
part_type_direction(pt, 0, 0, 0, 0);
part_type_gravity(pt, 0, 0);
part_type_orientation(pt, image_angle, image_angle, 0, 0, 0);
part_type_blend(pt, 0);
part_type_life(pt, 0, 50);

pt2 = part_type_create();

part_type_shape(pt2, pt_shape_pixel);
part_type_size(pt2, 1, 1, 0, 0);
part_type_scale(pt2, 1, 1);
part_type_colour1(pt2, c_white);
part_type_alpha3(pt2, 1, .5, 0);
part_type_speed(pt2, 0, .5, 0, 0);
part_type_direction(pt2, dir - 190, dir - 170, 0, 0);
part_type_gravity(pt2, 0, 0);
part_type_orientation(pt2, 0, 0, 0, 0, 0);
part_type_blend(pt2, 0);
part_type_life(pt2, 0, 50);

