xscalemax = 1;
yscalemax = 1;
xscale = xscalemax;
yscale = yscalemax;
dad = noone;
angle = 0;
spread = 0;
recoil_len = 0;
recoil_len_max = 0;
recoil_size = 6;
xxAc = 1;
xxAc2 = 1;
ac_vel = .05;
adicional_angle = 0;
push_player = 0;
dir = 0;
nearest_enemy = noone;
auto_aim = 5;
level = 1;

surf_ww = camera_get_view_width(view_camera[0]);
surf_hh = camera_get_view_height(view_camera[0]);
cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);


image_speed = 0;
reload = false;
reload_count = 0;
shoot_part_quant = 1;
debree_speed = 3;
debree_size = 1;
spawn_bullet_dist = 14;
shoot_count = 0;
shoot_delay = 1;
shoot_sound = noone;
shoot_volume = .1;
cock_sound = false;
piercing_shot = false;

damage = 1;
iid = items.love;

bullet_speed = 5;
bullet_count = 3;

level = 1;

ps = part_system_create();
pt = part_type_create();
pe = part_emitter_create(ps);
pt3 = part_type_create();
pe3 = part_emitter_create(ps);

part_system_automatic_draw(ps, false);
part_system_depth(ps, depth - 1);

ps2 = part_system_create();
pt2 = part_type_create();
pe2 = part_emitter_create(ps2);

part_system_automatic_draw(ps2, false);




event_user(1);

