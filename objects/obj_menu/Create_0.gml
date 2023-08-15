logo_scale = 0;
able = false;
logo_y = display_get_gui_height();
continua_alp = 0;

ps = part_system_create();
pt = part_type_create();

part_system_automatic_draw(ps, false);

part_type_shape(pt, pt_shape_pixel);
part_type_size(pt, 1, 2, 0, 0);
part_type_scale(pt, 1, 1);
part_type_colour1(pt, c_white);
part_type_alpha3(pt, 0, 1, 0);
part_type_speed(pt, 0, .1, 0, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_gravity(pt, 0, 0);
part_type_orientation(pt, 0, 0, 0, 0, 0);
part_type_blend(pt, 0);
part_type_life(pt, 500, 1000);

part_delay = 0;