/// @description Level
// You can write your code in this editor


for(var i = 0; i < array_length(global.my_items); i++) { 
	if(iid == global.my_items[i][0]) { 
		level = global.my_items[i][1]; 	
	}	
}

if(level >= 2) { 
	
	candy_quant_max = 3;
}				  
if(level >= 3) {  
	candy_delay = 5;
	candy_quant_max = 5;
}				  
if(level >= 4) {  
	candy_quant_max = 7;
}				  
if(level >= 5) {  
	candy_delay = 4;
	global.items_damage[items.candy, items_damage_info.damage] = 50/100;
	candy_quant_max = 9;
}				  
