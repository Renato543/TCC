for(var i = 0; i < array_length(global.my_items); i++) { 
	if(iid == global.my_items[i][0]) { 
		level = global.my_items[i][1]; 	
	}	
}

if(level >= 2) { 
	shoot_delay = .5;
}				  
if(level >= 3) {  
	shoot_delay = .25;
}				  
if(level >= 4) {  
	piercing_shot = true;
}				  
if(level >= 5) {  
	shoot_delay = .1;
}				  
