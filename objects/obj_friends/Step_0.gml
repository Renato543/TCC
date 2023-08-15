if(global.levelling_up || global.pause || global.death) {
	exit;
}

xscale = lerp(xscale, 1, .3);
yscale = lerp(yscale, 1, .3);

if(yscale <= 0.51) instance_destroy();

vel = approach(vel, 0, vel_friction);

part_delay++;

if(part_delay >= 3) {
	part_delay = 0;
	part_particles_create(obj_friends_control.ps, x, y, pt, 1);
	
}

part_particles_create
(
	obj_friends_control.ps, 
	x + lengthdir_x(5, (dir - 180) + sin(global.current_time * .1) * 10),
	y + lengthdir_y(5, (dir - 180) + sin(global.current_time * .1) * 10), 
	pt2, 
	1
);

if(vel == 0) {
	instance_destroy();
	
	
}

velh = lengthdir_x(vel, dir);
velv = lengthdir_y(vel, dir);

x += velh;
y += velv;



