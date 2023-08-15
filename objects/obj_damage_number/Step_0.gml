if(global.levelling_up || global.pause || global.death) exit;

yscale = lerp(yscale, 1, .5);
xscale = lerp(xscale, 1, .5);

alpha_delay++;

if(dad) { 
	depth = dad.depth - 200;	
}

if(alpha_delay >= 3) { 
	alpha -= .1;
	if(alpha <= 0) instance_destroy();
	y -= .01;
}
else { 
	y = lerp(y, ystart - 5, .3);	
}

if(heal) color = make_color_rgb(114, 139, 79);
else {
	if(critical) color = make_color_rgb(184, 58, 79);
	else color = c_white;
}

