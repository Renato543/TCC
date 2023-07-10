

if(global.death) exit;
//draw_sprite_ext(spr_damage_alert, 0, 0, 0, 1, 1, 0, c_white, damage_alert_alp);

if(show_mouse) draw_circle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 2, false);

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


var xx = 10 + sprite_get_width(spr_stats_portrait_healthy)/2;
var yy = 10 + sprite_get_height(spr_stats_portrait_healthy)/2;
draw_sprite_ext(spr_stats_bar, 0, xx, yy, 1, 1, 0, c_white, 1);

var life_proportion = global.stats.life/global.stats.life_max;
var xp_proportion = xp/need_xp;

main_life_proportion = lerp(main_life_proportion, life_proportion, .1);
main_xp_proportion = lerp(main_xp_proportion, xp_proportion, .1);
draw_sprite_ext(spr_life_stats, 1, xx + 8, yy - 14, main_life_proportion * 286, 1, 0, c_yellow, 1);
draw_sprite_ext(spr_life_stats, 0, xx + 8, yy - 14, life_proportion * 286, 1, 0, c_white, 1);
draw_sprite_ext(spr_xp_stats, 0, xx + 13, yy - 8, main_xp_proportion * 229, 1, 0, c_white, 1);


if(damage_portrait) { 
	stats_portrait_sprite = spr_stats_portrait_hit;
}
else { 
	if(life_proportion <= .25) { 
		stats_portrait_sprite = spr_stats_portrait_hurt2;
	}
	else if(life_proportion <= .5) { 
		stats_portrait_sprite = spr_stats_portrait_hurt;
	}
	else { 
		stats_portrait_sprite = spr_stats_portrait_healthy;
	}
}

draw_sprite_ext(stats_portrait_sprite, stats_portrait_frame, xx, yy, stats_portrait_scale, stats_portrait_scale, 0, c_white, 1);

if(portrait_light_alp > 0) { 
	shader_set(sh_dmgLight);
	draw_sprite_ext(stats_portrait_sprite, stats_portrait_frame, xx, yy, stats_portrait_scale, stats_portrait_scale, 0, c_white, portrait_light_alp);
	shader_reset();
}


if(surface_exists(my_surf)) {
	surface_set_target(my_surf);
	draw_set_config(global.font);
	
	draw_reset_config();
	surface_reset_target();
}


draw_set_config(global.font,,, fa_left);
//draw_set_color(make_color_rgb(141, 186, 153));
//draw_text(10, 10, "life: " + string(global.stats.life) + "/" + string(global.stats.life_max));
//draw_set_color(make_color_rgb(141, 176, 186));
//draw_text(10, 25, "xp: " + string(xp) + "/" + string(need_xp));
//draw_set_color(make_color_rgb(162, 141, 186));
draw_text(xx + 16, 34, "nível: " + string(level));

var final_minute = minute <= 9 ? string("0") + string(minute): string(minute);
var final_second = second <= 9 ? string("0") + string(second): string(second);
draw_text_transformed(camera_get_view_width(view_camera[0])/2, 34, final_minute + ":" + final_second, general_scale, general_scale, 0);

//draw_set_color(c_white);
draw_reset_config();




