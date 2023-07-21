
if(keyboard_check_pressed(ord("R"))) room_restart();

if(global.death) {
	if(breathe_time) {
		breathe_count++;
		if(breathe_count >= 20) {
			breathe_scale = lerp(breathe_scale, 1, .05);	
			
			heart_beat_count++;
			
			heart_beat_time = .5 + (1 - anxiety_level) * 2;
			
			if(heart_beat_count >= heart_beat_time * room_speed) {
				heart_beat_count = 0;
				audio_pitch_variation(snd_heart_beat, 50, false);
			}
			
			if(feather_start) {
				if(!audio_is_playing(wind_audio)) wind_audio = audio_pitch_variation(snd_wind, 1, true, 0, .7, .7);
				else { 
					show_debug_message(wind_volume);
					audio_sound_gain(wind_audio, wind_volume * .5, 0);	
					audio_sound_pitch(wind_audio, wind_volume * .8);	
				}				
				
				
				
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
					anxiety_level -= .001;
				}
				else {
					anxiety_level += .00025;
					feather_goal_bright = lerp(feather_goal_bright, 130, .1);		
				}

				anxiety_level = clamp(anxiety_level, 0, 1);
		
				if(anxiety_level < .1)  { 
					anxiety_time_count++;
			
					if(anxiety_time_count >= room_speed * 5) { 
						obj_player.state = player_states.reviving;
						audio_pitch_variation(snd_buildup, 50, false, .75, .9, .9);
						global.revive_times--;
						breathe_time = false;
					}
				}
				
				
				if(anxiety_level > .4) { 
					anxiety_defeat_count++;	
					if(anxiety_defeat_count >= room_speed * 25) { 
						breathe_time = false;
						shake(12, .1);
						audio_pitch_variation(snd_defeat, 1, false, .5);
						global.revive_times = 0;
					}
				}
				
				
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
				
				
				if(mouse_check_button(mb_left)) {
					main_vspeed_prop = lerp(main_vspeed_prop, 1, .3);
				}
				else { 
					main_vspeed_prop = lerp(main_vspeed_prop, 0, .3);
				}
				
				wind_volume = abs(main_vspeed_prop)/1;
	
	
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
	
		
	
	
				feather_angle_str = feather_vspeed/.3;
				feather_angle_str = clamp(feather_angle_str, -.6, 2);
	
				if(feather_y + feather_vspeed <= 0 - sprite_get_height(spr_feather)/2 || feather_y + feather_vspeed >= display_get_gui_height() - sprite_get_height(spr_feather)) { 
					feather_vspeed = 0;	
				}
				else { 
					feather_rad += (1000/60) * abs(feather_angle_str);	
				}
	
				feather_y += feather_vspeed + abs(sin(feather_rad * .001)) * -.05;
		
				feather_y = clamp(feather_y , 0 - sprite_get_height(spr_feather)/2, display_get_gui_height() - sprite_get_height(spr_feather));
		
		
			}
			else { 
				feather_text_alpha = lerp(feather_text_alpha, 1, .1);
				var click = mouse_check_button_pressed(mb_left);
				feather_vspeed = -.3;
				if(click) { 
					feather_start = true;	
				}
			}
		
		}
	
	}
	else { 
		breathe_scale = lerp(breathe_scale, 0, .2);	
		if(audio_is_playing(wind_audio)) {
			audio_sound_gain(wind_audio, breathe_scale, 0);	
		}	
		
		
		if(breathe_scale <= .01) { 
			reset_breathe();	
			instance_destroy(obj_air);
			audio_stop_sound(wind_audio);
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
	if(global.revive_times <= 0) audio_pitch_variation(snd_defeat, 1, false, .5);
}

//if(victory) { 
//	victory_count++;
	
//	if(victory_count >= 60) { 
//		global.death = true;
//		instance_create_depth(0, 0, 0, obj_defeat_menu);
//	}
//}
