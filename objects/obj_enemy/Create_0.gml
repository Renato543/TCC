special = false;
special_check = false;
mp_speed = .5;
life = 1;
start_vel = .5;
vel = start_vel;
dir_to_player = 0;
velh = 0;
velv = 0;
boss = false;
push_x = 0;
push_y = 0;
xscalemax = 1;
yscalemax = 1;
flame_counting = 0;
chain_affected = false;
xscale = 0;
yscale = 0;
chance_to_drop_xp = 50;
move = true;
floating = true;
variation_vel = random_range(.003, .005);
rot_affected = false;
piercing_me = noone;
light_alp = 0;
electrocuted = false;
last_medit = noone;
last_scythe = noone;
last_stab = noone;
last_friend = noone;
trapped = false;
out_cam = true;
out_cam_count = 0;
out_cam_time_to_destroy = 15;
destroy = false;
death_sprite = spr_enemy_death;
angle = 0;
my_center = false;
center_margin = false;
color = 0;
hue = 0;
ps = noone;
variation = 0;
xp_orb_id = 0;
chance_to_drop_life = 10;

can_i_move = true;
if(instance_place(x, y, obj_enemy)) { 
	can_i_move = false;
	mask_index = spr_void;
}

test = 0;

hug_delay = 0;
last_candy = noone;
part_delay = 0;


event_user(1);
event_user(2);

function push_enemy(who_pushed, str) { 
	var dir = point_direction(who_pushed.x, who_pushed.y, x, y); 
	push_x = lengthdir_x(str, dir);
	push_y = lengthdir_y(str, dir);	
}