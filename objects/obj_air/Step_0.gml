

if(my_y <= -20) { 
	my_x = irandom_range(0, display_get_gui_width());
	my_y = display_get_gui_height() + 20;
	size = random_range(.5, 1);
}
else if(my_y >= display_get_gui_height() + 20) { 
	my_x = irandom_range(0, display_get_gui_width());
	my_y = -20;
	size = random_range(.5, 1);
}

rad += 1000/60;

xscale = lerp(xscale, xscale_destiny, .1);
yscale = lerp(yscale, yscale_destiny, .1);

my_y += my_vspeed;