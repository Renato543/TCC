/// @description Items

enum items { 
	love,
	candy,
	hug,
	meditation,
	friends,
	link,
	total
}


enum items_info { 
	level_min,
	able,
	type,
	achievement_id,
	total
}

enum items_type { 
	weapon,
	passive,
	total
}


global.items = ds_grid_create(items.total, items_info.total);
ds_grid_clear(global.items, 0);



insert_item(items.love, 0,  true);
insert_item(items.candy, 0,  true);
insert_item(items.hug, 0,  true);
insert_item(items.meditation, 0,  true);
insert_item(items.friends, 0, true);
insert_item(items.link, 0, true);












