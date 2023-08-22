if(!surface_exists(my_surface)) { 
	my_surface = surface_create(display_get_gui_width(), display_get_gui_height());	
}
else { 
	draw_surface(my_surface, 0, 0);
}

if(surface_exists(my_surface)) { 
	surface_set_target(my_surface);
	draw_set_color(c_black);
	
	
	var _box_x1 = 20;
	var _box_y1 = display_get_gui_height() - 60;
	var _box_x2 = display_get_gui_width() - 20;
	var _box_y2 = display_get_gui_height() - 20;
	
	var _portrait_width = 30;
	var _portrait_x1 = _box_x1 + 5;
	var _portrait_y1 = _box_y1 + 5;
	var _portrait_x2 = _box_x1 + 5 + _portrait_width;
	var _portrait_y2 = _box_y2 - 5;
	var _portrait_height = _portrait_y2 - _portrait_y1;

	draw_rectangle(_box_x1, _box_y1, _box_x2, _box_y2, false);
	draw_set_color(c_white);
	draw_rectangle(_box_x1, _box_y1, _box_x2, _box_y2, true);
	
	draw_rectangle(_portrait_x1, _portrait_y1, _portrait_x2, _portrait_y2, true);
	
	draw_sprite_ext(spr_stats_portrait_healthy, 0, _portrait_x1 + _portrait_width/2, _portrait_y1 + _portrait_height/2, 1, 1, 0, c_white, 1);
	draw_set_config(global.font,,, fa_left, fa_top);
	text = text_list[text_id];
	var _semi_text = string_copy(text, 1, caractere_id);
	var _string_height = string_height(_semi_text);
	var _rec_width = _box_x2 - _box_x1;
	
	draw_text_ext(_portrait_x2 + 5, _box_y1 + 5, string_lower(_semi_text), _string_height, _rec_width - _portrait_width - 5);
	
	//draw_text(_box_x1 + 5, _box_y1 + 10, string_lower(_semi_text));
	
	
	draw_reset_config();
	draw_set_color(-1);
	surface_reset_target();
}
