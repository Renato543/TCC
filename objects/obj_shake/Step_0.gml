if(global.pause) {
	view_xport[0] = 0;
	view_yport[0] = 0;
	exit;
}

delay++;

if(delay >= room_speed * time) { 
	instance_destroy();	
}

//camera_set_view_pos(view_camera[0], random_range(-strength, strength), random_range(-strength, strength));

view_xport[0] = random_range(-strength, strength);
view_yport[0] = random_range(-strength, strength);

