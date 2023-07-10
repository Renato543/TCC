color_id = 1;
color_count = 0;
radius = 0;
level = 1;
iid = items.meditation;
electrocuted_time = .5;
obj_camera.cam_scale = obj_camera.cam_scale_max * 1.002;
ps = part_system_create();
pt = part_type_create();
pe = part_emitter_create(ps);
meditation_str = 10;

part_system_automatic_draw(ps, false);