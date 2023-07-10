// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function insert_item(iid, level_min = 1, able = false, type = items_type.weapon, achievement_id = -1){

	global.items[# iid, items_info.level_min] = level_min;
	global.items[# iid, items_info.able] = able;
	global.items[# iid, items_info.type] = type;
	global.items[# iid, items_info.achievement_id] = achievement_id;
	
}