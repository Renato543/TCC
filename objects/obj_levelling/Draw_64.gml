

part_system_drawit(ps);
for(var i = 0; i < array_length(upgrades_id); i++ ) {
	
	var main_xx = (i + 1) * 110;
	draw_sprite_ext(spr_level_up_card, 0, main_xx, button_yy[i], button_xscale[i], button_yscale[i], 0, c_white, 1); 


	//draw_set_config(global.font);
	//var multiplier = i mod 2 == 1 ? 1: -1;
	//len_x = lengthdir_x(160 * button_xscale[i], angle) * multiplier;
	//len_y = lengthdir_y(160 * button_xscale[i], angle) * multiplier;
	//var name = global.language == 0? global.items_names_pt[upgrades_id[i]]: global.items_names_eng[upgrades_id[i]];
	//if(buff_upgrade) {
	//	switch(upgrades_id[i]) { 
	//		case 0: name = global.language == 0? "cura": "heal"; break;
	//		default: name = global.language == 0? "none": "none"; break;
	//	}
	//}
	//draw_text_transformed(button_xx[i] + len_x, yy + len_y, name, button_xscale[i], button_yscale[i], angle);
	
	
	var level = 0;
	for(var j = 0; j < array_length(global.my_items); j++) { 
		if(upgrades_id[i] == global.my_items[j][0]) { 
			level = global.my_items[j][1];	
		}
	}
	
	
	
	var spr_index = spr_items_portrait;
	var index = upgrades_id[i];
	draw_sprite_ext(spr_index, index, main_xx, button_yy[i] - 32, button_xscale[i], button_yscale[i], 0, c_white, 1);
	
	
	draw_set_config(global.font);
	var color = c_white;
	var angle2 = 0;
	if(level >= 1) var level_text = global.language == 0 ? "nvl." + string(level + 1): "lvl." + string(level + 1);
	else {
		var level_text = global.language == 0 ? "novo": "new";
		var hue = 125 + sin(global.current_time * .001) * 125;
		color = make_color_hsv(hue, 91, 255);
		angle2 = sin(global.current_time * .01) * 2;
	}
	draw_set_color(color);
	if(!buff_upgrade) draw_text_transformed(main_xx, button_yy[i], level_text, button_xscale[i], button_yscale[i], 0);
	draw_set_color(c_white);
	draw_reset_config();	
	
	
	
	
	
	
	if(i == selected_id && !leave_select) { 
	}

}

//for(var i = 0; i < array_length(upgrades_id); i++ ) {
//	if(!leave_select) {
//		if(i == selected_id) { 
//			draw_set_config(global.font);
//			var level = 0;
		
//			for(var j = 0; j < array_length(global.my_items); j++) { 
//				if(upgrades_id[i] == global.my_items[j][0]) { 
//					level = global.my_items[j][1];	
//				}
//			}		
			
//			if(buff_upgrade) {
//				switch(upgrades_id[i]) { 
//					case 0: var desc = global.language == 0? "cura 30% da vida máxima": "heal 30% of max life"; break;
//					default: var desc = global.language == 0? "none": "none"; break;
//				}
//			}
//			else { 
//				var desc = global.language == 0 ? global.items_desc_pt[upgrades_id[i], level]: global.items_desc_eng[upgrades_id[i], level];	
//			}
			
//			draw_text_transformed(view_wport[0]/2, view_hport[0] - 10, desc, button_xscale[i] * desc_scale, button_yscale[i] * desc_scale, 0);	
//			draw_reset_config();
//		}
//	}
//	else { 
//		if(global.language == 0) var desc = "sem aprimoramentos";
//		else var desc = "no upgrades";
//		draw_set_config(global.font, make_color_rgb(158, 69, 100));
//		draw_text_transformed(view_wport[0]/2, view_hport[0] - 10, desc, button_xscale[i] * desc_scale, button_yscale[i] * desc_scale, 0);	
//		draw_reset_config();
//	}
//}

//draw_sprite_ext(spr_level_leave, 0, view_wport[0] - 30, view_hport[0] - 30, leave_scale, leave_scale, 0, c_white, 1);
//if(leave_select) {
//	draw_sprite_ext(spr_level_leave_selection, 0, view_wport[0] - 30, view_hport[0] - 30, select_scale * leave_scale, select_scale * leave_scale, 0, c_white, 1);
//}

