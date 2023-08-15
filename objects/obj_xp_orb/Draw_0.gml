if(surface_exists(global.main_surface)) {
	surface_set_target(global.main_surface);
	if(!out_cam) {
		if(iid == sprite_get_number(sprite_index) - 1) {
			hue += 1;
			if(hue >= 255) hue = 0;
			color = make_color_hsv(hue, 100, 255);
		}
		else color = c_white;
		camera_apply(view_camera[0]);
		
		if(!follow_player) {
			draw_set_alpha(.8);
			draw_set_color(c_black);
			draw_ellipse(x - 5 * xscale, y + 1, x + 3 * xscale, y + 4, false);
			draw_set_color(c_white);
			draw_set_alpha(1);
		}

		draw_sprite_ext(sprite_index, iid, x, bbox_bottom + sprite_height/2, xscale, yscale * -1, image_angle, color, .6);

		draw_sprite_ext(spr_xp_orb_light, blink_frame, x, bbox_bottom  + sprite_height/2, xscale, yscale * -1, image_angle, image_blend, .6);

		draw_sprite_ext(sprite_index, iid, x, y, xscale, yscale, image_angle, color, image_alpha);

		draw_sprite_ext(spr_xp_orb_light, blink_frame, x, y, xscale, yscale, image_angle, image_blend, image_alpha);

		if(light_alp > 0) { 
			shader_set(sh_dmgLight);
			draw_sprite_ext(sprite_index, iid, x, y, xscale, yscale, image_angle, c_white, light_alp);
			shader_reset();
		}
	}
	surface_reset_target();
}


