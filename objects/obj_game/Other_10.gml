/// @description Enemy Spawner
// You can write your code in this editor


super_horde = true;


enemy_spawner_count = 0;
enemy_spawner_time = 50;
enemy_spawner_time_initial = 50;
global.enemy_max_number = 80;
enemy_list = [obj_enemy];
phase = 1;
decrease_vel = .01;
enemy_chance = [100];
enemy_multiplier = 1;

minute = 0;
second = 0;
all_seconds = (minute * 60) + (second);



function enemy_create(enemy_object, special = false) { 
	var _angle = irandom(360);
	var _dist = camera_get_view_width(view_camera[0])/2 + irandom(70);
	var _xx = obj_player.x + lengthdir_x(_dist, _angle);
	var _yy = obj_player.y + lengthdir_y(_dist, _angle);
	var enemy = instance_create_layer(_xx, _yy, "Enemies", enemy_object);	
	enemy.special = special;
	return enemy;
}

function minute_enemy() {
	var last_phase = phase;
	decrease_vel = .01;
	if(is_between(all_seconds, 0, 1, true)) { 
		phase = 1;
		enemy_spawner_time = max(enemy_spawner_time, 80);
		enemy_list = [obj_enemy];
		decrease_vel = .001;
		enemy_chance = [100];
	}
	else if(is_between(all_seconds, 1, 2, true)) { 
		phase = 2;
		enemy_spawner_time = max(enemy_spawner_time, 80);
		enemy_list = [obj_enemy2];
		enemy_chance = [100];
	}
	else if(is_between(all_seconds, 2, 3, true)) { 
		phase = 3;
		enemy_spawner_time = max(enemy_spawner_time, 30);
		enemy_list = [obj_enemy, obj_enemy2];
		enemy_chance = [50, 50];
	}
	else if(is_between(all_seconds, 3, 4, true)) { 
		phase = 4;
		enemy_spawner_time = max(enemy_spawner_time, 0);
		enemy_list = [obj_enemy2];
		enemy_chance = [100];

	}
	else if(is_between(all_seconds, 4, 30, true)) { 
		phase = 5;
		enemy_spawner_time = max(enemy_spawner_time, 20);
		enemy_list = [obj_enemy2];
		enemy_chance = [100];

	}
	
	
	
	
	enemy_spawner_time -= decrease_vel;	
	
	if(last_phase != phase) { 
		enemy_spawner_time_initial = room_speed;
		active_spawner = true; 
		
		switch(phase) { 
			case 4:
				enemy_spawner_time_initial = 0;
			break;
			
		}
		
		with(obj_enemy) { 
			if(!boss && out_cam) { 
				instance_destroy();	
			}	
		}
		
		enemy_spawner_time = enemy_spawner_time_initial;
	}
}



function spawn_enemy() {
	enemy_spawner_count++;
	minute_enemy();
	
	if(super_horde) { 
		enemy_spawner_time = 1;
		enemy_spawner_time_initial = 1;	
	}
	
	if(!boss_time) {

		if(enemy_spawner_count >= enemy_spawner_time && instance_number(obj_enemy) < global.enemy_max_number) { 
			enemy_spawner_count = 0;
		
			var chance_array = [];
			for(var i = 0; i < array_length(enemy_chance); i++) { 
				repeat(enemy_chance[i]) { 
					array_insert(chance_array, array_length(chance_array), i);	
				}	
			}
		

			var enemy_id = irandom(array_length(chance_array) - 1);
			repeat(enemy_multiplier) {
				enemy_create(enemy_list[chance_array[enemy_id]]);
			}
		}
	}
}


