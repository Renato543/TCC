//Lerp

if(global.levelling_up || global.pause) {
	image_speed = 0;
	exit;
}
else image_speed = 1;


xscale = lerp(xscale, xscalemax, .3);
yscale = lerp(yscale, yscalemax, .3);
light_alp = lerp(light_alp, 0, .3);

if(global.death) { 
	variation = sin(global.current_time * .001) * 2;
}
else {
	variation = sin(global.current_time * .005) * 2;
}

//Movement

var _up, _down, _left, _right, _gp_r_up, _gp_r_down, _gp_r_left, _gp_r_right;

if(!global.death) {
	vel = global.stats.spd;
	if(global.moving) {
		if(global.touch_dist_move >= obj_controller.deadzone_aim * obj_controller.circle_area) {
			velh = lengthdir_x(vel, global.touch_dir_move);
			velv = lengthdir_y(vel, global.touch_dir_move);
		}
		else { 
			velh = 0;
			velv = 0;
		}
	}
	else { 
		velh = 0;
		velv = 0;
	}

	final_velh = velh + push_x;
	final_velv = velv + push_y;

	push_x = lerp(push_x, 0, .3);
	push_y = lerp(push_y, 0, .3);


	x += final_velh * global.speed_multiplier;
	y += final_velv * global.speed_multiplier;



	depth = -y;

	if(xscalemax == 1) { 
		if(xscale < 0) xscale *= -1;
		else if(xscale > 0) xscale *= 1;	
	}
	else if(xscalemax == -1) { 
		if(xscale < 0) xscale *= 1;
		else if(xscale > 0) xscale *= -1;	
	}

	event_user(1);

	invencibility--;

	if(abs(velh) > 0 || abs(velv) > 0) { 
		state = player_states.walking;
	}
	else { 
		state = player_states.idle;	
	}

}

switch(state) { 
	case player_states.idle:
		image_speed = 1;
		sprite_index = skins.idle;
	break;
	
	case player_states.walking:
		image_speed = ( 1 + ( ( vel * global.speed_multiplier - 1 ) * 2) ) * ( sign(velh) != sign(xscalemax) ? -1: 1 );	
		
		sprite_index = skins.walking;
	break;
	
	case player_states.defeat:
		sprite_index = skins.defeat;
		defeat_shake_str = approach(defeat_shake_str, 0, .1);
		depth = -y - 400;
		shake(defeat_shake_str, .1);
		if(defeat_shake_str <= 0) { 
			obj_game.show_defeat = true;
			transition(room);
		}
	break;
}

if(!global.death) {
	xp_collision_check();
	enemy_collision_check();
}