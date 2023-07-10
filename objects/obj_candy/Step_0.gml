if(global.levelling_up || global.pause || global.death) {
	image_speed = 0;
	exit;
}
else image_speed = 1;


my_dir = attack_id * 5;
if(dad) { 
	x = obj_player.x + lengthdir_x(my_len + attack_id * my_len, dad.main_dir + my_dir);
	y = obj_player.y + lengthdir_y(my_len + attack_id * my_len, dad.main_dir + my_dir);
	destroy = dad.destroy;
}
else {
	x = obj_player.x + lengthdir_x(my_len + attack_id * my_len, main_dir + my_dir);
	y = obj_player.y + lengthdir_y(my_len + attack_id * my_len, main_dir + my_dir);
}
angle += 2;

time_to_spawn--;

event_user(0);

if(time_to_spawn <= 0 && !spawned) { 
	spawned = true;	
	if(candy_quant < candy_quant_max) { 
		var candy = instance_create_depth(x, y, depth - 1, obj_candy);
		candy.attack_id = attack_id + 1;
		candy.candy_quant = candy_quant + 1;
		candy.my_len = my_len;
		candy.main_dir = main_dir;
		candy.candy_quant_max = candy_quant_max;
		if(attack_id == 0) { 
			candy.dad = self;	
		}
		else { 
			candy.dad = dad;
		}
		
	}	
	
}


vel += .1;
main_dir += vel;	
time_to_destroy--;

if(time_to_destroy <= 0) { 
	destroy = true;	
}

if(destroy) { 
	xscale = lerp(xscale, 0, .1);
	yscale = lerp(yscale, 0, .1);	
	
	if(xscale <= .01) { 
		instance_destroy();	
	}
}
else { 
	xscale = lerp(xscale, 1, .3);
	yscale = lerp(yscale, 1, .3);	
}

