if(global.levelling_up || global.pause || global.death) {
	exit;
}

event_user(0);

count++;

if(count >= spawn_time * room_speed) { 
	count = 0;
	for(var i = 0; i < friends_quant; i++) {
		var dir = (i * 90) + initial_angle;
		var friend = instance_create_layer(obj_player.x, obj_player.y, "Weapons", obj_friends, { image_angle: dir });
		friend.friend_id = i;
		friend.dir = dir;
	}
	initial_angle += 45;
}

