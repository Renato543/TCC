// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function damage_check(iid){
	var random_number = irandom_range(1, 100);
	var critical_check = false;
	var final_damage = global.items_damage[iid][0];
	if(random_number <= global.items_damage[iid][1] + global.critical_global_chance) {
		critical_check = true;
		final_damage = global.items_damage[iid][0] * global.items_damage[iid][2];
	}
	
	//global.damage_counter[iid] += final_damage * global.damage_multiplier * global.base_damage;
	return [final_damage * global.damage_multiplier, critical_check];
}