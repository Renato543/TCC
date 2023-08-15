//if(!global.pause && !global.levelling_up && !global.death) {
//	if(global.mouse_aim) { 
//		draw_sprite_ext(spr_aim, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), general_scale, general_scale, 0, c_white, 1);
//	}
//	else {
//		camera_apply(view_camera[0]);
//		var len = 45;
//		var xx = obj_player.x;
//		var yy = obj_player.y - sprite_get_height(spr_player)/2;	

//		var xx_final = xx + lengthdir_x(len, obj_player.gamepad_angle);
//		var yy_final = yy + lengthdir_y(len, obj_player.gamepad_angle);

//		var scale = 1;

//		draw_sprite_ext(spr_aim, 0, xx_final, yy_final, scale, scale, 0, c_white, 1);

//	}
//}
