if(global.levelling_up || global.pause || global.death) {
	exit;
}

xscale = lerp(xscale, 1, .3);
yscale = lerp(yscale, 1, .3);



image_angle = direction;

with(dad) { 
	bullet_part(other.x, other.y, other.image_angle);	
}

with(obj_enemy) { 	
	var bullet_col = instance_place(x, y, other);
	if(bullet_col && !out_cam) { 
		damage_sound();
		if(!other.piercing_shot && life > 0) instance_destroy(other);
		var general_check = damage_check(other.iid);
		var final_damage = general_check[0];
		var critical_check = general_check[1];
		var hit_me = false;
		
		if(piercing_me == other.id) hit_me = true;
		if(!hit_me) {
			push_x = lengthdir_x(other.push_str, other.image_angle);
			push_y = lengthdir_y(other.push_str, other.image_angle);
			xscale = 1.05 * xscalemax;
			yscale = .95;
			if(other.piercing_shot) piercing_me = other.id;
			life -= final_damage;
			light_alp = 1;
			create_damage_number(final_damage, critical_check);
		}
	}	
}

x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

out_cam = !instance_place(x, y, obj_camera_collision);

if(out_cam) { 
	instance_destroy();
} 
