global.death = true;


if(global.death) {
	if(feather_start) {
		feather_text_alpha = lerp(feather_text_alpha, 0, .1);
		if(instance_number(obj_air) < 50) {
			
			var part_x = irandom_range(0, display_get_gui_width());
			var part_y = irandom_range(0, display_get_gui_height());
		
			var air = instance_create_depth(part_x, part_y, depth + 10, obj_air);
			air.my_x = part_x;
			air.my_y = part_y;
		}
	
		feather_goal_rad += 1000/60;
		feather_goal_y = display_get_gui_height()/2 - sin(feather_goal_rad * .0005) * display_get_gui_height()/3;
	
		var dis_ww = display_get_gui_width();
		var dis_hh = display_get_gui_height();
		var angle = sin(feather_rad * .001) * 30;
		var len_xx = lengthdir_x(20, 270 + angle);
		var len_yy = lengthdir_y(20, 270 + angle);
		var goal_ww = sprite_get_width(spr_feather_goal);
		var goal_hh = sprite_get_height(spr_feather_goal);
		//Feather collision
		var feather_col = rectangle_in_rectangle(
	
			dis_ww/2 + len_xx - sprite_get_width(spr_feather)/2, 
			feather_y + len_yy - sprite_get_height(spr_feather)/2 + 8, 
			dis_ww/2 + len_xx + sprite_get_width(spr_feather)/2,
			feather_y + len_yy + sprite_get_height(spr_feather)/2 - 8,
			dis_ww/2 - goal_ww/2, 
			feather_goal_y - goal_hh/2, 
			dis_ww/2 + goal_ww/2 - 1, 
			feather_goal_y + goal_hh/2 - 1				   
						   
		);
	
	

		if(feather_col > 0) { 
			feather_goal_bright = lerp(feather_goal_bright, 255, .1);	
			anxiety_level -= .0005;
		}
		else { 
			feather_goal_bright = lerp(feather_goal_bright, 130, .1);		
		}

		anxiety_level = clamp(anxiety_level, 0, 1);
		with(obj_air) { 
			//var scale_destiny = 1;
		
			//scale_destiny = other.feather_vspeed < 0 ? 1 + (abs(other.feather_vspeed)/.4) - .2: 1;
		
			var temp_yscale_destiny = 1;
			if(mouse_check_button(mb_left)) {
				my_vspeed = lerp(my_vspeed, -10 * size, .3);	
				temp_yscale_destiny = 1.8;
				yscale_destiny = 3.8;
			}
			else { 
				my_vspeed = lerp(my_vspeed, .4 * size, .1);	
				yscale_destiny = 1;	
			}
			xscale_destiny = 2 - temp_yscale_destiny;
		
		}
	
	
		var touch = mouse_check_button(mb_left);
		damage_alert_alp = lerp(damage_alert_alp, 0, .1);
	
		feather_vspeed += feather_gravity;
	
	
		feather_vspeed = clamp(feather_vspeed, -.8, .7);
	
		if(touch) { 
			feather_accel -= .0005;	
		}
		else { 
			feather_accel = 0;	
		}
		feather_accel = clamp(feather_accel, -1, 0);
		feather_vspeed += feather_accel;
		if(feather_vspeed >= 0) { 
		
		}
		else { 
	
		}
	
		feather_rad += (1000/60) * abs(feather_angle_str);
	
	
		feather_angle_str = feather_vspeed/.3;
		feather_angle_str = clamp(feather_angle_str, -.6, 2);
	
		feather_y += feather_vspeed + abs(sin(feather_rad * .001)) * -.05;
	}
	else { 
		feather_text_alpha = lerp(feather_text_alpha, 1, .1);
		var click = mouse_check_button_pressed(mb_left);
		feather_vspeed = .3;
		if(click) { 
			feather_start = true;	
		}
	}
	
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
