if(global.levelling_up || global.pause || global.death) {
	image_speed = 0;
	exit;
}else image_speed = 1;

xscale = lerp(xscale, 1, .1);
yscale = lerp(yscale, 1, .1);
light_alp = lerp(light_alp, 0, .3);

if(follow_player) { 
	if(start_follow) { 
		spd += .1;
		dir = point_direction(x, y, obj_player.x, obj_player.y);
		image_angle += (spd * 4) * (obj_player.x <= x ? 1 : -1);
	}
	else { 
		y = lerp(y, ystart - 10, .3);
		delay_to_follow++;
		
		if(delay_to_follow >= 15) { 
			start_follow = true;
			delay_to_follow = 0;
		}
	}
}
else { 
	if(distance_to_object(obj_player) < global.xp_range) { 
		xscale = 1.15;
		yscale = 1.15;
		light_alp = 1;
		follow_player = true;
	}	
}

out_cam = !instance_place(x, y, obj_camera_collision);

if(out_cam) { 
	out_cam_count++;
	if(out_cam_count >= out_cam_time_to_destroy * room_speed) instance_destroy();
} 
else { 
	out_cam_count = 0;
}

depth = -bbox_bottom;

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

blink_delay++;

if(blink_delay >= room_speed * 3) { 
	frame_count++;
	if(frame_count >= 3) { 
		frame_count = 0;
		if(blink_frame < sprite_get_number(spr_xp_orb_light) - 1) { 
			blink_frame++;
		}
		else { 
			blink_frame = 0;
			blink_delay = 0;
		}
	}
	
}

