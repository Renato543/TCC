if(global.pause) exit;

cam_scale = lerp(cam_scale, cam_scale_max, cam_vel);

var ww_final = initial_cam_ww * cam_scale;
var hh_final = initial_cam_hh * cam_scale;
camera_set_view_size(view_camera[0], ww_final, hh_final);

var ww = camera_get_view_width(view_camera[0]);
var hh = camera_get_view_height(view_camera[0]);

var x_destiny = obj_player.x;
var y_destiny = obj_player.y;


if(global.death) { 
	cam_vel = .1;
	cam_scale_max = .5;
}
else { 
	cam_vel = .2;
	cam_scale_max = 1;	
}

x = lerp(x, x_destiny, .1);
y = lerp(y, y_destiny, .1);

camera_set_view_pos(view_camera[0], x - ww/2, y - hh/2);