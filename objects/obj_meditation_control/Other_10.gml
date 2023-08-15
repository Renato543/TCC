/// @description Level
// You can write your code in this editor


for(var i = 0; i < array_length(global.my_items); i++) { 
	if(iid == global.my_items[i][0]) { 
		level = global.my_items[i][1]; 	
	}	
}

if(level >= 2) { 
	meditation_time = 8;
	meditation_str = 10;
}				  
if(level >= 3) {  
	meditation_time = 7;
	meditation_str = 20;
}				  
if(level >= 4) {  
	meditation_time = 6;
	meditation_str = 25;
}				  
if(level >= 5) {  
	meditation_time = 5;
	meditation_str = 30;
}				  
