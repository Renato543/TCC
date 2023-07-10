image_angle -= 10 * speed;
image_xscale -= .01;
image_yscale -= .01;

out_cam = !instance_place(x, y, obj_camera_collision);

if(image_xscale <= 0 || out_cam) instance_destroy();

