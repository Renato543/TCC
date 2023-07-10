if(global.levelling_up || global.pause || global.death) {
	image_speed = 0;
	exit;
}
else image_speed = 1;

event_user(0);

cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);
depth = dad.depth - 1;

adicional_angle = lerp(adicional_angle, 0, .3);

xxAc = approach(xxAc, 1, ac_vel);
var _channel = animcurve_get_channel(ac_recoil, "recoil");
var _value = animcurve_channel_evaluate(_channel, xxAc);

recoil_len = _value;

xxAc2 = approach(xxAc2, 1, .05);
var _channel = animcurve_get_channel(ac_love, "love");
var _value = animcurve_channel_evaluate(_channel, xxAc2);

xscale = _value;
yscale = _value;




if(instance_exists(obj_controller)) {
	if(obj_controller.check_aim) {
		if(global.touch_dist_aim >= obj_controller.deadzone_aim * obj_controller.circle_area) {
			dir = point_direction(x, y, x + lengthdir_x(15, global.touch_dir_aim), y + lengthdir_y(15, global.touch_dir_aim));
			auto_aim = 30;
		}
		else if(auto_aim <= 0) { 
			if(instance_exists(nearest_enemy)) {
				if(point_distance(dad.x, dad.y, nearest_enemy.x, nearest_enemy.y) < 200) {
					dir = point_direction(dad.x, dad.y, nearest_enemy.x, nearest_enemy.y);	
				}
				else { 
					nearest_enemy = noone;	
				}
			}
			else { 
				nearest_enemy = instance_nearest(dad.x, dad.y, obj_enemy);	
			}
		}
		auto_aim--;
	}
	
}


if(x + lengthdir_x(15, dir) <= x) xscalemax = -1;
else if(x + lengthdir_x(15, dir) > x) xscalemax = 1;
x = ( dad.x + dad.variation ) + lengthdir_x(15 + (recoil_len * recoil_size), dir);
y = ( dad.y + dad.variation ) - sprite_get_height(spr_player)/2 + lengthdir_y(15 + (recoil_len * recoil_size), dir);


if(xscalemax == 1) { 
	if(xscale < 0) xscale *= -1;
	else if(xscale > 0) xscale *= 1;	
	
	angle = dir + adicional_angle;
}
else if(xscalemax == -1) { 
	if(xscale < 0) xscale *= 1;
	else if(xscale > 0) xscale *= -1;	
	angle = dir - 180 + adicional_angle;
}

shoot_count++;



if(shoot_count >= shoot_delay * room_speed) { 
	shoot_count = 0;
	xxAc = 0;
	xxAc2 = 0;
	
	with(obj_player) { 
		push_x = lengthdir_x(other.push_player, other.dir - 180);
		push_y = lengthdir_y(other.push_player, other.dir - 180);
	}
	
	var shoot_xx = x + lengthdir_x(spawn_bullet_dist, dir);
	var shoot_yy = y + lengthdir_y(spawn_bullet_dist, dir);
	
	shoot_part(x, y, 10);
	audio_pitch_variation(snd_love, 50, false, .5);
	audio_pitch_variation(snd_love2, 50, false, .075);
	with(instance_create_depth(shoot_xx, shoot_yy, depth + 1, obj_love_bullet, { image_angle : dir })) {
		dad = other;
		spd = other.bullet_speed;
		direction = other.dir + irandom_range(-other.spread, other.spread);
		iid = other.iid;
		piercing_shot = other.piercing_shot;
	}

}

for(var i = 0; i < array_length(global.my_items); i++) { 
	if(iid == global.my_items[i][0]) { 
		level = global.my_items[i][1]; 	
	}	
}

