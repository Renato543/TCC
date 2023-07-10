/// @description Draw functions
// You can write your code in this editor

function draw_stats() {
	static temp_life = global.stats.life;
	
	//Life
	temp_life = lerp(temp_life, global.stats.life, .3);
	var life_proportion = temp_life/global.stats.life_max;
	var height_proportion = (1 - life_proportion) * sprite_get_height(spr_life_stats);
	draw_set_color(c_white);

	draw_sprite_part_ext(spr_life_stats, 0, 0, height_proportion, sprite_get_width(spr_life_stats), sprite_get_height(spr_life_stats), 7, 5 + height_proportion, 1, 1, c_white, 1);

	//Level
	static temp_xp = xp;
	
	temp_xp = lerp(temp_xp, xp, .3);
	var max_xscale = 290;
	var xp_proportion = temp_xp/need_xp;
	xp_proportion = clamp(xp_proportion, 0, 1);

	draw_sprite_ext(spr_xp_stats, 0, 27, 8, max_xscale * xp_proportion, 1, 0, c_white, 1);
}

