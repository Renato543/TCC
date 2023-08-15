// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_set_config(font, color = c_white, alpha = 1, halign = fa_center, valign = fa_middle){
	draw_set_font(font);
	draw_set_halign(halign);
	draw_set_valign(valign);
	draw_set_alpha(alpha);
	draw_set_color(color);
}