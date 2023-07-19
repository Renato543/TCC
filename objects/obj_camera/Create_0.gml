cam_scale_max = 1;
cam_scale = .5;
cam_vel = .1;
initial_cam_ww = camera_get_view_width(view_camera[0]);
initial_cam_hh = camera_get_view_height(view_camera[0]);

camera_set_view_size(view_camera[0], initial_cam_ww * cam_scale, initial_cam_hh * cam_scale);
var x_destiny = obj_player.x;
var y_destiny = obj_player.y;

x = x_destiny;
y = y_destiny;
camera_set_view_pos(view_camera[0], x  - camera_get_view_width(view_camera[0])/2, y - camera_get_view_height(view_camera[0])/2);



my_collision = instance_create_depth(x, y, depth, obj_camera_collision);