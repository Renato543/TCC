if(global.death) {
	image_speed = 0;
	image_alpha = lerp(image_alpha, .4, .3);
	exit;
}
else { 
	image_alpha = lerp(image_alpha, 1, .3);	
}

if(global.levelling_up || global.pause) {
	image_speed = 0;
	exit;
}
else image_speed = 1;




depth = -y;

xscale = lerp(xscale, xscalemax, .3);
yscale = lerp(yscale, yscalemax, .3);
light_alp = lerp(light_alp, 0, .3);


if(center_margin) my_center = y;
else my_center = y - sprite_get_height(sprite_index)/2;

out_cam = !instance_place(x, y, obj_camera_collision);

if(out_cam && !boss) { 
	out_cam_count++;
	if(out_cam_count >= out_cam_time_to_destroy * room_speed) instance_destroy();
} 
else { 	
	out_cam_time_to_destroy = 15;
	out_cam_count = 0;
}

if(!destroy) {

	if((electrocuted > 0 || trapped) && !boss) { 
		vel = 0;
		part_delay++;
	
		if(electrocuted > 0) {
			if(part_delay >= 5) {
				part_delay = 0;
				event_user(0);
			}
		}
	}
	else { 
		if(boss && out_cam) { 
			if(vel <= obj_player.vel + 3) vel = obj_player.vel + 3;	
		}
		else {
			vel = start_vel;
		}
	}

	electrocuted--;


	var has_priority = noone

	with(obj_player_attraction) { 
		if(!has_priority && priority) { 
			has_priority = self;
		}
	}
	if(instance_exists(has_priority)) var near_attraction = has_priority;
	else var near_attraction = obj_player;
	
	

	if(move) {
		if(near_attraction.x <= x) xscalemax = -1;
		else if(near_attraction.x > x) xscalemax = 1;
	}

	if(xscalemax == 1) { 
		if(xscale < 0) xscale *= -1;
		else if(xscale > 0) xscale *= 1;	
	}
	else if(xscalemax == -1) { 
		if(xscale < 0) xscale *= 1;
		else if(xscale > 0) xscale *= -1;	
	}

	if(special && !special_check) {
		life = 30;
		vel = .75;
		special_check = true;
	}

	dir_to_player = point_direction(x, y, near_attraction.x, near_attraction.y);

	if(can_i_move) {
		mask_index = sprite_index;
		velh = lengthdir_x(vel, dir_to_player);
		velv = lengthdir_y(vel, dir_to_player);
		
		if(distance_to_point(near_attraction.x, near_attraction.y) <= 0) { 
			velh = 0;
			velv = 0;
		}
		
		//collision();
		//mp_potential_step_object(near_attraction.x, near_attraction.y, mp_speed, obj_enemy); 
	}
	else { 
		mask_index = spr_void;
		velh = 0;
		velv = 0;
		if(!collision_rectangle(x - sprite_width/2, y - sprite_height, x + sprite_width/2, y, obj_enemy, false, true)) { 
			can_i_move = true;
		}
	
	}
	
	

	var hurt_box_col = instance_place(x, y, obj_hurtbox);

	if(hurt_box_col) { 
		var deal_damage = true;
		
		if(hurt_box_col.iid == items.candy) {
			if(last_candy == hurt_box_col.id || hurt_box_col.destroy) {
				deal_damage = false;
			}
		}
		
		if(hurt_box_col.iid == items.friends && last_friend == hurt_box_col.id) deal_damage = false;
		
		if(deal_damage) {
			damage_sound();
			
			
			var general_check = damage_check(hurt_box_col.iid);
			var final_damage = general_check[0];
			var critical_check = general_check[1];
	
			life -= final_damage;	
			light_alp = 1;
			create_damage_number(final_damage, critical_check);
			
			switch(hurt_box_col.iid) { 
				case items.candy:
					last_candy = hurt_box_col.id;
				break;
				
				case items.friends:
					last_friend = hurt_box_col.id;		
					push_x = lengthdir_x(3, hurt_box_col.dir);
					push_y = lengthdir_y(3, hurt_box_col.dir);
				break;
				
				case items.link:
					instance_destroy(hurt_box_col);
				break;
			}
			
		}
	
	}
	hug_delay--;

	if(life <= 0) { 
		if(!destroy) {
			xscale = 1.2 * xscalemax;
			yscale = 1.2;
			destroy = true;
		}
		image_index = 0;
		
		if(boss) {
			obj_game.active_spawner = true;
			obj_game.victory = true;
		}
		
		global.enemy_kills++;
		instance_destroy();	
		if(instance_number(obj_xp_orb) < 150) {
			var chance = irandom_range(1, 100);
			var percent = global.chance_to_drop_xp;
			if(special) xp_orb_id = sprite_get_number(spr_xp_orb) - 1;
			
			
			if(chance <= percent) { 
				var orb = instance_create_layer(x, y, "Orbs", obj_xp_orb);	
				orb.iid = xp_orb_id;
			}
		}
		
		with(particle_effect(false, death_sprite, x, y, depth, angle, image_alpha, xscale, yscale)) { 
			light_alp = 1;	
			boss = other.boss;
			color = other.color;
			hue = other.hue;
		};
		
	}

}
else { 
	velh = 0;
	velv = 0;

}

var final_velh = velh + push_x;
var final_velv = velv + push_y;

x += final_velh;
y += final_velv;

push_x = lerp(push_x, 0, .3);
push_y = lerp(push_y, 0, .3);

