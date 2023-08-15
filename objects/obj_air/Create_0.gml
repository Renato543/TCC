can_be_destroyed = false;
size = random_range(.5, 1);
my_x = 0;
my_y = 0;
my_vspeed = 0;
xscale_destiny = 1;
yscale_destiny = 1;
xscale = 0;
yscale = 0;
rad = 0;
sin_vel = random_range(.001, .005);

var chance = irandom(100);

sin_str = 0;
if(chance <= 20) { 
	sin_str = random_range(1, 2);	
}

depth = obj_game.depth - 10;