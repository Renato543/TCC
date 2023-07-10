// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function approach(value1, value2, increment){
	if (value1 < value2)
		return min(value1 + increment, value2); 
	else
		return max(value1 - increment, value2);
}