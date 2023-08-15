/// @description Items Spawner
// You can write your code in this editor

for(var i = 0; i < array_length(global.my_items); i++) { 
	//Love spawn
	if(global.my_items[i][0] == items.love && !instance_exists(obj_love)) {
		my_love = instance_create_layer(x, y - sprite_get_height(spr_player)/2, "Weapons", obj_love);	
		my_love.dad = self;
	}
	
	//Candy
	if(global.my_items[i][0] == items.candy && !instance_exists(obj_candy_control)) {
		my_candy = instance_create_layer(x, y - sprite_get_height(spr_player)/2, "Weapons", obj_candy_control);	
	}
	
	//Hug
	if(global.my_items[i][0] == items.hug && !instance_exists(obj_hug_control)) {
		my_hug = instance_create_layer(x, y - sprite_get_height(spr_player)/2, "Weapons", obj_hug_control);	
	}
	
	//Meditation
	if(global.my_items[i][0] == items.meditation && !instance_exists(obj_meditation_control)) {
		my_meditation = instance_create_layer(x, y, "Weapons", obj_meditation_control);	
	}
	
	if(global.my_items[i][0] == items.friends && !instance_exists(obj_friends_control)) {
		my_friend = instance_create_layer(x, y, "Weapons", obj_friends_control);	
	}
	
	if(global.my_items[i][0] == items.link && !instance_exists(obj_link)) {
		my_friend = instance_create_layer(x, y, "Weapons", obj_link);	
	}
}
