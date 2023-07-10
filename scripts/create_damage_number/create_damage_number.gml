// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_damage_number(final_damage, critical_check){
	if(instance_number(obj_damage_number) < 30) {
		var dmg_numb = instance_create_depth(x, y - 15, depth - 1, obj_damage_number);
		dmg_numb.damage = final_damage;
		dmg_numb.critical = critical_check;
		dmg_numb.dad = self;
	}
}