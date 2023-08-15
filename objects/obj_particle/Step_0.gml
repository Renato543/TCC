if(global.pause || global.levelling_up || global.death) { 
	image_speed = 0;
	exit;	
}
else image_speed = 1;

velh = hspeed;
velv = vspeed;

light_alp = lerp(light_alp, 0, .3);

out_cam = !instance_place(x, y, obj_camera_collision);

if(out_cam) instance_destroy();

if(depth_sorting) depth = -y;
friction += fric;

if(scale_mode) { 
	image_xscale -= scale_speed;
	image_yscale -= scale_speed;
	
	if(image_xscale <= 0) { 
		instance_destroy();		
	}
}

x += velh;
y += velv;
y += gravity_str;


