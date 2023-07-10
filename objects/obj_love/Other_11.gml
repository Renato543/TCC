/// @description Bullet destroy part
// You can write your code in this editor

function bullet_destroy_part(xx, yy) { 
	//part_type_sprite(pt, spr_bullet_particle, false, false, false);
	//part_type_size(pt, .5, 1.5, 0, 0);
	//part_type_scale(pt, 1, 1);
	//part_type_colour1(pt, c_white);
	//part_type_alpha3(pt, 1, 1, 1);
	//part_type_speed(pt, .1, 1, 0, 0);
	//part_type_direction(pt, 0, 360, 0, 0);
	//part_type_gravity(pt, 0, 0);
	//part_type_orientation(pt, 0, 360, 0, 0, 0);
	//part_type_blend(pt, 0);
	//part_type_life(pt, 3, 3);

	//part_emitter_region(ps, pe, xx, xx, yy, yy, pt_shape_pixel, ps_distr_linear);
	//part_emitter_burst(ps, pe, pt, 3);	
}

function shoot_part(xx, yy, quant = 1) { 
	part_type_sprite(pt2, spr_bullet, false, false, false);
	part_type_size(pt2, 1, 1.5, -.05, 0);
	part_type_scale(pt2, 1, 1);
	part_type_colour1(pt2, c_white);
	part_type_alpha3(pt2, 1, 1, 1);
	part_type_speed(pt2, 0, 2, 0, 0);
	part_type_direction(pt2, 0, 360, 0, 0);
	part_type_gravity(pt2, .01, 90);
	part_type_orientation(pt2, angle, angle, 5, 0, true);
	part_type_blend(pt2, 0);
	part_type_life(pt2, 0, 200);

	part_emitter_region(ps2, pe2, xx, xx, yy, yy, pt_shape_pixel, ps_distr_linear);
	part_emitter_burst(ps2, pe2, pt2, quant);	
}

function bullet_part(xx, yy, angle) { 
	part_type_sprite(pt3, spr_bullet, false, false, false);
	part_type_size(pt3, 1, 1, 0, 0);
	part_type_scale(pt3, 1, 1);
	part_type_colour1(pt3, c_white);
	part_type_alpha3(pt3, 1, .5, 0);
	part_type_speed(pt3, 0, 0, 0, 0);
	part_type_direction(pt3, 0, 0, 0, 0);
	part_type_gravity(pt3, 0, 0);
	part_type_orientation(pt3, angle, angle, 0, 0, 0);
	part_type_blend(pt3, 0);
	part_type_life(pt3, 0, 50);



	part_emitter_region(ps, pe3, xx, xx, yy, yy, pt_shape_pixel, ps_distr_linear);
	part_emitter_burst(ps, pe3, pt3, 1);	
}