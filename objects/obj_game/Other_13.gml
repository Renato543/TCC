/// @description Environment Control
// You can write your code in this editor

max_supplies = 6;

function spawn_supplie() { 
	var supplies_number = instance_number(obj_supplies);
	if(supplies_number < max_supplies) { 
		var range = irandom_range(500, 600);
		var dir = irandom(360);
		var xx = obj_player.x + lengthdir_x(range, dir);
		var yy = obj_player.y + lengthdir_y(range, dir);
		instance_create_layer(xx, yy, "Supplies", obj_supplies);
	}
}