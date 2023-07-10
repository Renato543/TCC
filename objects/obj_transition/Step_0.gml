if(go) { 
	alp = approach(alp, 1, vel);
	
	if(alp >= 1) { 
		time_to_change++;
		
		if(time_to_change >= 30) { 
			room_goto(destiny);
			go = false;
		}
	}
}
else {
	alp = approach(alp, 0, vel * 2);
	
	if(alp <= 0) { 
		instance_destroy();	
	}
		
	
}