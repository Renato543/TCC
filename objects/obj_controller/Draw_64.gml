if(!surface_exists(my_surf)) { 
	my_surf = surface_create(view_wport[0], view_hport[0]);
	surface_set_target(my_surf);
	surface_reset_target();
}
else { 
	draw_surface(my_surf, 0, 0);
	surface_set_target(my_surf);
	draw_clear_alpha(0, 0);
	surface_reset_target();
}

if(surface_exists(my_surf)) { 
	surface_set_target(my_surf);
	
	draw_set_alpha(.8);
	var dep = 6;
	if(check_move) {
		
		
		for(var i = 0; i < dep; i++) {
			draw_sprite_ext(spr_controller_symbols, 0, initial_x_move, initial_y_move + i, 1, 1, 0, c_black, .6);
			draw_circle_color(initial_x_move, initial_y_move + i, circle_area, c_black, c_black, true);
		}
		draw_sprite_ext(spr_controller_symbols, 0, initial_x_move, initial_y_move, 1, 1, 0, c_white, .6);
		draw_circle(initial_x_move, initial_y_move, circle_area, true);
		
	
		var xx = initial_x_move + lengthdir_x(global.touch_dist_move, global.touch_dir_move);
		var yy = initial_y_move + lengthdir_y(global.touch_dist_move, global.touch_dir_move);
		for(var i = 0; i < dep; i++) {
			draw_circle_color(xx, yy + i, 16, c_black, c_black, false);
		}
		draw_circle(xx, yy, 16, false);
	}
	
	if(check_aim) { 
		for(var i = 0; i < dep; i++) {
			draw_sprite_ext(spr_controller_symbols, 1, initial_x_aim, initial_y_aim + i, 1, 1, 0, c_black, .6);
			draw_circle_color(initial_x_aim, initial_y_aim + i, circle_area, c_black, c_black, true);
		}
		
		draw_sprite_ext(spr_controller_symbols, 1, initial_x_aim, initial_y_aim, 1, 1, 0, c_white, .6);
		draw_circle(initial_x_aim, initial_y_aim, circle_area, true);
		
		
		
	
		var xx = initial_x_aim + lengthdir_x(global.touch_dist_aim, global.touch_dir_aim);
		var yy = initial_y_aim + lengthdir_y(global.touch_dist_aim, global.touch_dir_aim);
		for(var i = 0; i < dep; i++) {
			draw_circle_color(xx, yy + i, 16, c_black, c_black, false);	
		}
		draw_circle(xx, yy, 16, false);
		
		
	}
	
	draw_set_alpha(1);
	
	
	surface_reset_target();
}
