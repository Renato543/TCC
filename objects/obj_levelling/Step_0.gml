

part_time--;
			
if(!chose) { 
	event_user(2);
	
	for(var i = 0; i < array_length(button_xscale); i++) { 
		button_xscale[i] = lerp(button_xscale[i], 1, .1);
		button_yscale[i] = lerp(button_yscale[i], 1, .1);
		button_yy[i] = lerp(button_yy[i], (camera_get_view_height(view_camera[0])/2) + 10, .2);	
	}	
}

//Select keys
if(able) {
	if(chose) { 
		desc_scale = lerp(desc_scale, 0, .3);
		leave_scale = lerp(leave_scale, 0, .3);
		for(var i = 0; i < array_length(button_xscale); i++) { 
			var check = true;
			if(!leave_select && i == selected_id) check = false;
			
			if(check) {
				button_xscale[i] = lerp(button_xscale[i], 1, .1);
				button_yscale[i] = lerp(button_yscale[i], 0, .1);
				button_yy[i] = lerp(button_yy[i], button_initial_yy[i], .2);
			}	
		}
		destroy_delay++;
		
		if(destroy_delay >= (room_speed/2) + 10) { 
			
			button_xscale[selected_id] = lerp(button_xscale[selected_id], 0, .3);
			button_yscale[selected_id] = lerp(button_yscale[selected_id], 0, .3);	
			
			if(button_yscale[selected_id] <= .1) {
				instance_destroy();
				if(!leave_select) {
					var already_has = false;
					var index = 0;
			
					for(var i = 0; i < array_length(global.my_items); i++) { 
						if(global.my_items[i][0] == upgrades_id[selected_id]) { 
							already_has = true;
							index = i;
						}
					}
			
					if(already_has) { 
						global.my_items[index][1]++;	
					}
					else { 
						array_insert(global.my_items, array_length(global.my_items), [upgrades_id[selected_id], 1]);
					}
				}
				
			}
		}
		else { 
			button_xscale[selected_id] = lerp(button_yscale[selected_id], 1, .1);
			button_yscale[selected_id] = lerp(button_yscale[selected_id], 1, .1);		
		}
		
	}
	else {
		desc_scale = lerp(desc_scale, 1, .3);

		var click_btn = mouse_check_button_pressed(mb_left);
		
		//first
		
		var temp_select = -1;
		for(var i = 0; i < array_length(button_xscale); i++) { 
			
			var cam_x = camera_get_view_x(view_camera[0]);
			var cam_y = camera_get_view_y(view_camera[0]);
			var x1 = cam_x + ((i + 1) * 110) - sprite_get_width(spr_level_up_card)/2;
			var y1 = cam_y + button_yy[i] - sprite_get_height(spr_level_up_card)/2;
			var x2 = cam_x + ((i + 1) * 110) + sprite_get_width(spr_level_up_card)/2;
			var y2 = cam_y + button_yy[i] + sprite_get_height(spr_level_up_card)/2;
			
			
			var check_mouse = point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2);
			if(check_mouse) {
				temp_select = i;
				break;
			}
		}
		
		if(click_btn && temp_select != -1) { 
			selected_id = temp_select;
			chose = true;
			button_xscale[selected_id] = 1.1;
			button_yscale[selected_id] = 1.1;
		}
		
		

		//if(choose_button) { 
		//	//sound_click();
		//	chose = true;
		//	select_scale = 1.2;
		//	button_xscale[selected_id] = 1.04;
		//	button_yscale[selected_id] = 1.04;
		//}
	
	}

}

max_select = array_length(upgrades_id) - 1;
selected_id = clamp(selected_id, 0, max_select);

