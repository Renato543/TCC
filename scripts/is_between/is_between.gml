// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function is_between(value, minn, maxx, convert_to_min = false){
	if(convert_to_min) return value == clamp(value, minn * room_speed, maxx * room_speed); 
	else return value == clamp(value, minn, maxx);
}