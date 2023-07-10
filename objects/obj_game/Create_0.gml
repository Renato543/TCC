window_set_cursor(cr_none);

xp_per_orb = 10;
xp = 0;
show_mouse = false;

need_xp = 50;
active_spawner = true;
global.chance_to_drop_xp = 75;

//Player stats

global.stats = { 
	life: 100,
	life_max: 100,
	spd: 1
}

feather_y = display_get_gui_height()/2;
feather_accel = 0;
feather_vspeed = 0;
feather_gravity = .0025;
feather_angle_str = 1;
feather_rad = 0;



main_life_proportion = 1;
main_xp_proportion = 0;
global.death = false;
global.enemy_kills = 0;
global.levelling_up = false;
global.mouse_aim = true;
previous_mouse_x = mouse_x;
previous_mouse_y = mouse_y;
stats_portrait_scale = 1;
stats_portrait_sprite = spr_stats_portrait_healthy;
stats_portrait_frame = 0;
stats_portrait_count = 0;
portrait_light_alp = 0;
damage_portrait = 0;


// Enemy Spawner

//global.my_items = [
//	[items.gun, 10],
//	[items.direct_laser, 10],
//	[items.laser_robot, 10],
//	[items.knife, 10],
//	[items.grenade, 10],
//	[items.damage_passive, 10],
//	[items.knowledge, 10],
//	[items.spike, 10],
//	[items.ricochet, 10],
//	[items.magnetism, 10]
//];

global.my_items = [
	[items.love, 1]
];


item_show_damage = false;

level = 0;
for(var i = 0; i < array_length(global.my_items); i++) { 
	level += global.my_items[i][1];	
}


enum items_damage_info { 
	damage,
	critical_chance,
	critical_damage	
}

global.items_damage = [
	[100/100, 2, 2],
	[25/100, 2, 2],
	[10/100, 2, 2],
	[0, 0, 0],
	[100/100, 2, 2],
	[20/100, 2, 2]
];

global.base_damage = 100;

global.base_damage_multiplier = 1;
global.base_speed_multiplier = 1;
global.base_critical_global_chance = 0;
global.base_xp_multiplier = 1;

global.damage_multiplier = 1;
global.speed_multiplier = 1;
global.critical_global_chance = 0;
initial_range_xp = 10;
global.xp_range = initial_range_xp;

temp_damage_multiplier = 0;
temp_speed_multiplier = 0;
temp_critical_global_chance = 0;
damage_alert_alp = 0;

global.max_items = 10;


timer_count = 0;

event_user(0);
event_user(2);
event_user(3);
event_user(4);
event_user(5);

ww = camera_get_view_width(view_camera[0]);
hh = camera_get_view_height(view_camera[0]);
xx = camera_get_view_x(view_camera[0]);
yy = camera_get_view_y(view_camera[0]);
my_surf = noone;

function instances_quantity(activated = true) {
	if(activated) {
		show_debug_message("geral: " + string(instance_count));
		var sum = instance_number(obj_enemy) + instance_number(obj_xp_orb);
		show_debug_message("geral exceto: " + string(instance_count - sum));
		show_debug_message("Enemies: " + string(instance_number(obj_enemy)));
		show_debug_message("Xp_orbs: " + string(instance_number(obj_xp_orb)));
		show_debug_message("numbers: " + string(instance_number(obj_damage_number)));
	}
}

depth = -10;
pausedelay = 0;
boss_time = false;
victory = false;
victory_count = 0;
general_scale = 1;
show_defeat = false;
defeat_scale = 0;

global.enemy_hit_audio = [];

reverb_emitter = audio_emitter_create();
reverb_bus = audio_bus_create();

audio_emitter_bus(reverb_emitter, reverb_bus);

var audio_effect = audio_effect_create(AudioEffectType.Reverb1);
audio_effect.mix = .4;

reverb_bus.effects[0] = audio_effect;