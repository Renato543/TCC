if(global.levelling_up || global.pause) {
	exit;
}

event_user(0);

count++;

if(count >= meditation_time * room_speed) { 
	count = 0;
	var med = instance_create_layer(obj_player.x, obj_player.y, "Weapons", obj_meditation);
	med.meditation_str = meditation_str;
	
	
}