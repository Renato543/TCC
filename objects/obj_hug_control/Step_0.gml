if(global.levelling_up || global.pause || global.death) {
	image_speed = 0;
	exit;
}
else image_speed = 1;

event_user(0);

delay_count++;

if(delay_count >= hug_delay * room_speed) { 
	delay_count = 0;
	var hug = instance_create_layer(obj_player.x, obj_player.y, "Weapons", obj_hug);
	hug.range = range;
}