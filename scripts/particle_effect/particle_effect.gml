// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function particle_effect(scale_mode = false, sprite, xx, yy, sprite_depth, angle = 0, alpha = 1, xscale = 1, yscale = 1, sprite_speed = 1, blend = c_white){
	var part = instance_create_depth(xx, yy, sprite_depth, obj_particle);
	part.sprite_index = sprite;
	part.image_speed = sprite_speed;
	part.image_xscale = xscale;
	part.image_yscale = yscale;
	part.image_angle = angle;
	part.image_alpha = alpha;
	part.image_blend = blend;
	part.scale_mode = scale_mode;
	
	return part;
}
