depth = obj_player.depth + 1000000;

back_particles();

if(!update) { 
	repeat(100) {
		back_particles();
	}
	part_system_automatic_update(ps, false);
	repeat(room_speed * 2) { 
		part_system_update(true);
	}
	part_system_automatic_update(ps, true);
	update = true;	
}
