/// @description Level
// You can write your code in this editor


for(var i = 0; i < array_length(global.my_items); i++) { 
	if(iid == global.my_items[i][0]) { 
		level = global.my_items[i][1]; 	
	}	
}

if(level >= 2) { 
	spawn_time = 4;
	global.items_damage[iid, items_damage_info.damage] = 200/100;
}				  
if(level >= 3) {  
	spawn_time = 3;
	global.items_damage[iid, items_damage_info.damage] = 300/100;
}				  
if(level >= 4) {  
	spawn_time = 2;
	global.items_damage[iid, items_damage_info.damage] = 400/100;
}				  
if(level >= 5) {  
	spawn_time = 1;
	global.items_damage[iid, items_damage_info.damage] = 500/100;
}				  
