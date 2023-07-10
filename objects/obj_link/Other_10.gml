for(var i = 0; i < array_length(global.my_items); i++) { 
	if(iid == global.my_items[i][0]) { 
		level = global.my_items[i][1]; 	
	}	
}

if(level >= 2) { 
	fragment_quant = 6;
	quant = 6;
}				  
if(level >= 3) {  
	fragment_quant = 8;
	quant = 8;
}				  
if(level >= 4) {  
	fragment_quant = 10;
	quant = 10;
}				  
if(level >= 5) {  
	fragment_quant = 12;
	quant = 12;
}				  
