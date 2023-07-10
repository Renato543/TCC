// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shake(strength, time){
	var sh = instance_create_depth(0, 0, 0, obj_shake);
	sh.strength = strength;
	sh.time = time;
	
	return sh;
}