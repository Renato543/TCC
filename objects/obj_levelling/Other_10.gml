/// @description Random upgrades
// You can write your code in this editor
randomize();
upgrades_id = [];
var ables_upgrades = [];
var quant_items = array_length(global.my_items);


if(quant_items < global.max_items) {
	for(var i = 0; i < ds_grid_width(global.items); i++) { 
		if(global.items[# i, items_info.able] && obj_game.level >= global.items[# i, items_info.level_min]) { 
			var already_has = false;
			var level = -1;
			for(var j = 0; j < array_length(global.my_items); j++) { 
				already_has = global.my_items[j][0] == i;
				level = global.my_items[j][1];
				if(already_has) break;
			}
		
		
			if(!already_has) {
				array_insert(ables_upgrades, array_length(ables_upgrades), i);
			}
			else { 
				if(level < 5) {
					var quant = 8;
					var how_many_items = array_length(global.my_items);
					
					if(level < 5) how_many_items = 0;
					
					var quant_final = quant - how_many_items;
					
					if(level > 5) quant_final -= round(level * .2);
				
					quant_final = max(1, quant_final);
				
					repeat(quant_final) array_insert(ables_upgrades, array_length(ables_upgrades), i);	
				}
			}
		}
	}
}
else { 
	for(var j = 0; j < array_length(global.my_items); j++) { 
		if(global.my_items[j][1] < 10) {
			 array_insert(ables_upgrades, array_length(ables_upgrades), global.my_items[j][0]);		
		}
	}
}


var max_upgrades = array_length(ables_upgrades) < 3 ? array_length(ables_upgrades): 3;

var passive_count = 0;
while(array_length(upgrades_id) < max_upgrades) { 	
	var rand_number = irandom(array_length(ables_upgrades) - 1);
	
	
	var has_weapon = false;
	
	for(var i = 0; i < array_length(ables_upgrades); i++) { 
		if(global.items[# ables_upgrades[i], items_info.type] == items_type.weapon) { 
			has_weapon = true;
			break;
		}
	}
	
	
	for(var i = 0; i < array_length(ables_upgrades); i++) { 
		var add = true;
		if(i == rand_number) { 
			if(global.items[# ables_upgrades[i], items_info.type] == items_type.passive && passive_count >= 2 && has_weapon) { 
				add = false;	
				if(index == -1) index = i;
				array_delete(ables_upgrades, index, delete_number);
			}
			
			if(add) {
				array_insert(upgrades_id, array_length(upgrades_id), ables_upgrades[i]);
				var delete_number = 0;
				var index = -1;
				for(var j = 0; j < array_length(ables_upgrades); j++) {
					if(ables_upgrades[i] == ables_upgrades[j]) {
						if(index == -1) index = j;
						delete_number++;
					}
				}
				
				if(global.items[# ables_upgrades[i], items_info.type] == items_type.passive) { 
					passive_count++;	
				}
			
				if(index == -1) index = i;
				array_delete(ables_upgrades, index, delete_number);
				
			}
			
			break;
		}
	}
	if(array_length(ables_upgrades) <= 0) break;
	
}

if(array_length(upgrades_id) <= 0) {
	if(obj_game.level > global.max_items) {
		buff_upgrade = true;
		array_insert(upgrades_id, array_length(upgrades_id), 0);
	}
}




