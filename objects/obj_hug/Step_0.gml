if(global.levelling_up || global.pause || global.death) {
	image_speed = 0;
	exit;
}
else image_speed = 1;

if(destroy) { 
	xscale = lerp(xscale, 0, .3);
	yscale = lerp(yscale, 0, .3);
	
	if(xscale <= .01) instance_destroy();
}
else {
	xscale = lerp(xscale, 1, .3);
	yscale = lerp(yscale, 1, .3);
}

vel = lerp(vel, 0, .3);

depth = obj_player.depth - 1000;

circle_delay++;

if(circle_delay >= 20) { 
	circle_delay = 0;
	array_insert(circle_list, array_length(circle_list), 1);
}

for(var i = 0; i < array_length(circle_list); i++) { 
	circle_list[i] -= .025;
	if(circle_list[i] <= 0) array_delete(circle_list, i, 1);	
}



if(xscale > .5) {
	with(obj_enemy) { 
		if(!other.destroy) {
			var hug_col = collision_circle(other.x, other.y, other.range, self, false, false);
	
			if(hug_col && hug_delay <= 0) {
				var general_check = damage_check(other.iid);
				var final_damage = general_check[0];
				var critical_check = general_check[1];
	
				life -= final_damage;	
				light_alp = 1;
				create_damage_number(final_damage, critical_check);
		
				hug_delay = 10;
				var dir = point_direction(x, y, other.x, other.y);
				var dist = point_distance(x, y, other.x, other.y);
				var final_vel = min(1.5, dist);
				push_x = lengthdir_x(final_vel, dir);
				push_y = lengthdir_y(final_vel, dir);	

			}
		}
	}

}

time_to_destroy--;

if(time_to_destroy <= 0) { 
	destroy = true;	
}

x += lengthdir_x(vel, vel_dir);
y += lengthdir_y(vel, vel_dir);
