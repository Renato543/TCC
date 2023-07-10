if(global.levelling_up || global.death) {
	check_move = false;
	check_aim = false;
	exit;
}

device_count = clamp(device_count, 0, 1);

if(!check_move) {
	if(!check_aim || (check_aim && aim_device == 1)) {
		move_device = 0;
	}
	else move_device = 1;
}


var touch_hold_move = device_mouse_check_button(move_device, mb_left);

if(!touch_hold_move) { 
	check_move = false;	

}

if(touch_hold_move && !check_move && device_mouse_x_to_gui(move_device) <= camera_get_view_width(view_camera[0])/2) { 
	check_move = true;
	initial_x_move = device_mouse_x_to_gui(move_device);
	initial_y_move = device_mouse_y_to_gui(move_device);
}

if(check_move) {
	global.moving = true;
	global.touch_dist_move = point_distance(initial_x_move, initial_y_move, device_mouse_x_to_gui(move_device), device_mouse_y_to_gui(move_device));
	global.touch_dir_move = point_direction(initial_x_move, initial_y_move, device_mouse_x_to_gui(move_device), device_mouse_y_to_gui(move_device));
}
else { 
	global.moving = false;	
}

global.touch_dist_move = clamp(global.touch_dist_move, 0, circle_area);


if(!check_aim) {
	if(!check_move || (check_move && move_device == 1)) aim_device = 0;
	else aim_device = 1;
}

var touch_hold_aim = device_mouse_check_button(aim_device, mb_left);

if(!touch_hold_aim) { 
	check_aim = false;	
}

if(touch_hold_aim && !check_aim && device_mouse_x_to_gui(aim_device) > camera_get_view_width(view_camera[0])/2) { 

	check_aim = true;
	initial_x_aim = device_mouse_x_to_gui(aim_device);
	initial_y_aim = device_mouse_y_to_gui(aim_device);
}

if(check_aim) {
	global.touch_dist_aim = point_distance(initial_x_aim, initial_y_aim, device_mouse_x_to_gui(aim_device), device_mouse_y_to_gui(aim_device));
	global.touch_dir_aim = point_direction(initial_x_aim, initial_y_aim, device_mouse_x_to_gui(aim_device), device_mouse_y_to_gui(aim_device));

}

global.touch_dist_aim = clamp(global.touch_dist_aim, 0, circle_area);