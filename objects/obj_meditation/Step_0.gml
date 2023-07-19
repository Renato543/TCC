if(global.levelling_up || global.pause || global.death) {
	exit;
}



radius += radius_vel;
if(radius >= camera_get_view_width(view_camera[0])){ 
	instance_destroy();	
}

event_user(0);
event_user(1);

color_count++;

if(color_count >= 3) { 
	color_count = 0;
	color_id *= -1;
}

depth = obj_player.depth + 100;




with(obj_enemy) { 
	var medit_col = collision_circle(other.x, other.y, other.radius, self, false, false);
	if(medit_col) {
		if(electrocuted <= 0 && last_medit != other) {
			light_alp = .3;
			xscale = 1.1 * xscalemax;
			yscale = .9 * yscalemax;
			var dir = point_direction(other.x, other.y, x, y);
			push_x = lengthdir_x(other.meditation_str, dir);
			push_y = lengthdir_y(other.meditation_str, dir);
			last_medit = other;
		}
	}
}	
