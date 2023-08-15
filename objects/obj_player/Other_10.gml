/// @description Collision Check
// You can write your code in this editor

function xp_collision_check() { 	
	with(obj_xp_orb) { 
		var player_col = instance_place(x, y, other);
		if(player_col) {
			if(start_follow) {
				//if(array_length(global.xp_sound_list) < 5) {
				//	var hit_sound = audio_pitch_variation(snd_xp_orb, 50, false, .5);
				//	array_insert(global.xp_sound_list, array_length(global.xp_sound_list), hit_sound);
				//}
				
				instance_destroy();	
				
				var xp_mult = 1;
				switch(iid) { 
					case 0: xp_mult = 1; break;
					case 1: xp_mult = 5; break;
					case 2: xp_mult = 10; break;
					case 3: xp_mult = 20; break;
					case 4: xp_mult = 50; break;
				}
				
				
				obj_game.xp += obj_game.xp_per_orb * xp_mult * global.base_xp_multiplier;

			}
		}
	}	
	
	var life_col = instance_place(x, y, obj_life);
	
	if(life_col) { 
		instance_destroy(life_col);	
	}
}

function damage_part() { 
	//part_type_sprite(pt2, spr_stab_particle2, false, false, false);
	//part_type_size(pt2, .1, 1, 0, 0);
	//part_type_scale(pt2, 1, 1);
	//part_type_colour1(pt2, make_color_rgb(99, 31, 67));
	//part_type_alpha3(pt2, 1, 1, 1);
	//part_type_speed(pt2, .1, 2, 0, 0);
	//part_type_direction(pt2, 0, 360, 0, 0);
	//part_type_gravity(pt2, .1, 270);
	//part_type_orientation(pt2, 0, 0, 0, 0, true);
	//part_type_blend(pt2, 0);
	//part_type_life(pt2, 0, 50);


	//part_emitter_region(ps, pe2, x - sprite_width/2, x + sprite_width/2, y, y - sprite_height, pt_shape_pixel, ps_distr_linear);
	//part_emitter_burst(ps, pe2, pt2, 5);	
}


function enemy_collision_check() { 
	var enemy_col = instance_place(x, y, obj_enemy);
	
	if(enemy_col && invencibility <= 0) {
		audio_pitch_variation(snd_hurt, 50, false, .25,.6, .7);
		damage_part();
		//gamepad_vibrate();
		obj_game.damage_alert_alp = 1;
		obj_game.stats_portrait_scale = 1.3;
		obj_game.damage_portrait = 30;
		obj_game.portrait_light_alp = .5;
		invencibility = room_speed;
		shake(10, .1);
		light_alp = 1;
		xscale = 1.2;
		yscale = .8;
		global.stats.life -= 10;	
	}


}