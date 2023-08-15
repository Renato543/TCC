/// @description Buffs control
// You can write your code in this editor

enum buffs_list { 
	heal_buff,
	speed_buff,
	damage_buff,
	orb_buff
}

global.buffs = []; 
buff_counter = 0;

function buffs_count (){ 
	for(var i = 0; i < array_length(global.buffs); i++ ) { 
		global.buffs[i][1]--;
	}
	
	for(var i = 0; i < array_length(global.buffs); i++ ) { 
		if(global.buffs[i][1] <= 0) { 
			switch(global.buffs[i][0]) { 
				case buffs_list.speed_buff:		temp_speed_multiplier  = 0; break;
				case buffs_list.damage_buff:	temp_damage_multiplier = 0; break;
			}	
			array_delete(global.buffs, i, 1);
			
		}
	}

}

function buffs_check() { 
	buffs_count();
	for(var i = 0; i < array_length(global.buffs); i++) { 
		switch(global.buffs[i][0]) { 
			case buffs_list.speed_buff:		temp_speed_multiplier  = .5; break;
			case buffs_list.damage_buff:	temp_damage_multiplier = 1; break;
			case buffs_list.orb_buff:		
				with(obj_xp_orb) { 
					if(!follow_player) {
						xscale = 1.15;
						yscale = 1.15;
						light_alp = 1;
						follow_player = true;	
					}
				}
			break;
		}	
	}
	
}