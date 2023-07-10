if(global.death) {
	damage_alert_alp = lerp(damage_alert_alp, 0, .1);
	exit;
}

if(global.levelling_up || global.pause) exit;


portrait_light_alp = lerp(portrait_light_alp, 0, .3);
stats_portrait_scale = lerp(stats_portrait_scale, 1, .3);
damage_portrait--;

stats_portrait_count++;


if(stats_portrait_count >= room_speed/sprite_get_speed(stats_portrait_sprite)) { 
	stats_portrait_count = 0;
	if(stats_portrait_frame < sprite_get_number(stats_portrait_sprite)) { 
		stats_portrait_frame++;
	}
	else { 
		stats_portrait_frame = 0;
	}
	
}

randomize();

if(show_defeat) defeat_scale = lerp(defeat_scale, 1, .1);

global.stats.spd = clamp(global.stats.spd, 0, 2);

damage_alert_alp = lerp(damage_alert_alp, 0, .1);

instances_quantity(false);

event_user(6);
event_user(7);

if(active_spawner) spawn_enemy();
event_user(1);
//spawn_supplie();
layer_depth(layer_get_id("Background"), obj_player.depth + 100000000000);
//buffs_check();

timer_count++;

if(timer_count >= room_speed) { 
	all_seconds++;
	second++;	
	timer_count = 0;
}

if(second == 60) { 
	second = 0;
	minute++;
}


global.stats.life = clamp(global.stats.life, 0, global.stats.life_max);



if(instance_number(obj_enemy) >= global.enemy_max_number) { 
	with(obj_enemy) { 
		out_cam_time_to_destroy = 5;	
	}	
}


if(global.stats.life <= 0) { 
	global.death = true;
	obj_player.image_index = 0;
	shake(10, .1);
	obj_player.state = player_states.defeat;
	audio_pitch_variation(snd_defeat, 1, false, .5);
}

//if(victory) { 
//	victory_count++;
	
//	if(victory_count >= 60) { 
//		global.death = true;
//		instance_create_depth(0, 0, 0, obj_defeat_menu);
//	}
//}