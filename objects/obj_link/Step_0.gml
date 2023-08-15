if(global.levelling_up || global.pause || global.death) {
	image_speed = 0;
	exit;
}
else image_speed = 1;

event_user(0);

xxAc = approach(xxAc, 1, .09);
light_alp = lerp(light_alp, 0, .1);

var _channel = animcurve_get_channel(ac_love, "link_create");
main_scale = animcurve_channel_evaluate(_channel, xxAc);

if(spawn_check && main) { 
	spawn_check = false;
	x = obj_player.x + 2;
	y = obj_player.y;
}

if(main) { 
	time_to_spawn_other--;
}
else { 
	scale_destiny = 1 - (item_id/quant) * .5;
	

}


xscale = lerp(xscale, scale_destiny, .3);
yscale = lerp(yscale, scale_destiny, .3);

if(item_id < quant) { 
	time_to_create--;
}
else { 
	time_to_create = 30;
}

if(!linked && !instance_exists(dad)) { 
	time_to_destroy--;
	
	if(time_to_destroy <= 0) { 
		instance_destroy();
	}
}


if(item_id < quant && !spawned_segment && time_to_create <= 0 && linked) { 
	var create_dir = point_direction(0, 0, obj_player.velh, obj_player.velv) - 180;
	
	var segment = instance_create_layer(x + lengthdir_x(sprite_width, create_dir), y + lengthdir_y(sprite_width, create_dir), "Weapons", obj_link);
	segment.item_id = item_id + 1;
	segment.quant = quant;
	segment.main = false;
	if(main) segment.the_main = id;
	segment.dad = id;
	spawned_segment = true;
}

var my_son_exists = false;
with(obj_link) { 
	if(item_id == other.item_id + 1 && linked) { 
		my_son_exists = true;	
	}	
}

if(!my_son_exists) spawned_segment = false;

if(time_to_create <= 0) { 
	time_to_create = 30;	
}

can_i_be_destroyed--;
var enemy_col = instance_place(x, y, obj_enemy);
if(enemy_col && !main && can_i_be_destroyed <= 0) {
	instance_destroy();	
	with(obj_link) { 
		if(item_id > other.item_id) { 
			linked = false;	
		}	
	}
}




if(main) {
	
	if(abs(obj_player.velh) > 0 || abs(obj_player.velv) > 0) {
		moving = true;	
	}
	else { 
		moving = false;	
	}
	
	//if(moving_check > 0) dir = point_direction(x, y, obj_player.x, obj_player.y);
	
	if(moving) { 
		x = lerp(x, obj_player.x, .3);
		y = lerp(y, obj_player.y, .3);
		dir = point_direction(x, y, obj_player.x, obj_player.y);
	}
}
else {
	if(instance_exists(dad)) { 
		moving = dad.moving;
		
		//if(moving_check > 0) dir = point_direction(x, y, obj_player.x, obj_player.y);
		
		if(moving) { 
			var temp_dir = point_direction(dad.x, dad.y, x, y);
			dir = point_direction(x, y, dad.x, dad.y);
			x = lerp(x, dad.x + lengthdir_x(sprite_width, temp_dir), .3);
			y = lerp(y, dad.y + lengthdir_y(sprite_width, temp_dir), .3);
		}
		
		
	}

} 

moving_check--;