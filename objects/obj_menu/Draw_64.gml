var _xx = display_get_gui_width();
var _yy = display_get_gui_height();

part_system_drawit(ps);
var _variation = sin(global.current_time * .001) * 5;

draw_sprite_ext(spr_logo_light, 0, _xx/2, logo_y + _variation, logo_scale, logo_scale, 0, c_white, .5);
draw_sprite_ext(spr_logo, 0, _xx/2, logo_y + _variation, logo_scale, logo_scale, 0, c_white, 1);

draw_set_config(global.font,, continua_alp * abs(sin(global.current_time * .001)));
draw_text(_xx/2, display_get_gui_height() * 3/4, "toque para continuar.");
draw_reset_config();