
logo_scale = lerp(logo_scale, 1, .3);

var _click = mouse_check_button_pressed(mb_left);

if(able) { 
	logo_y = lerp(logo_y, display_get_gui_height()/4 + 20, .1);
	continua_alp = lerp(continua_alp, 1, .1);
	
	if(_click) { 
		transition(Game);	
	}
}
else { 
	logo_y = lerp(logo_y, display_get_gui_height()/2, .1);	
	continua_alp = lerp(continua_alp, 0, .1);
	
	if(_click) { 
		able = true;	
	}
}

part_delay++;

if(part_delay >= 5) {
	part_delay = 0;
	part_particles_create(ps, irandom(display_get_gui_width()), irandom(display_get_gui_height()), pt, 1);
}