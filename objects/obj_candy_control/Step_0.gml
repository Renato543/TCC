if(global.levelling_up || global.pause || global.death) {
	image_speed = 0;
	exit;
}
else image_speed = 1;

event_user(0);

delay_count++;

if(delay_count >= candy_delay * room_speed) { 
	delay_count = 0;
	for(var i = 0; i < 4; i++) { 
		var main_candy = instance_create_depth(obj_player.x, obj_player.y, depth - 1, obj_candy);
		main_candy.my_len = 11;
		main_candy.main_dir = 90 * i;
		main_candy.candy_quant_max = candy_quant_max;
	}	
}