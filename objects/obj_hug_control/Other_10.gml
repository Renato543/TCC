/// @description Level
// You can write your code in this editor


for(var i = 0; i < array_length(global.my_items); i++) { 
	if(iid == global.my_items[i][0]) { 
		level = global.my_items[i][1]; 	
	}	
}

if(level >= 2) { 
	range = 40;
}				  
if(level >= 3) {  
	hug_delay = 7;
	range = 50;
}				  
if(level >= 4) {  
	range = 60;
}				  
if(level >= 5) {  
	range = 80;
	hug_delay = 6;
	global.items_damage[items.candy, items_damage_info.damage] = 20/100;

}				  
