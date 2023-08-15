event_inherited();

//Visual

xscalemax = 1;
yscalemax = 1;
xscale = xscalemax;
yscale = yscalemax;
light_alp = 0;
variation = 0;

//Movement
move = true;
velh = 0;
vel = 0;
velv = 0;
push_x = 0;
push_y = 0;
final_velh = 0;
final_velv = 0;
gamepad_angle = 0;
player_shake = 0;

//Stats

invencibility = 0;

event_user(0);

//States

skins = { 
	idle: spr_player,
	walking: spr_player,
	defeat: spr_player_defeat
}

delay_to_desintegrate = 2 * room_speed;
delay_to_defeat = 60;
defeat_shake_str = 10;

enum player_states { 
	idle,
	walking,
	defeat,
	reviving
}

reviving_load = 0;
u_brightness = shader_get_uniform(sh_brightness, "brightness");

state = player_states.idle;

my_love = noone;
my_candy = noone;
my_hug = noone;
my_meditation = noone;
my_friend = noone;

event_user(2);