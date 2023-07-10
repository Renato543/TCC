global.levelling_up = true;
selected_id = 0;
buff_upgrade = false;
leave_select = false;
leave_scale = 0;
make_sound = false;
desc_scale = 1;
max_select = 2;
delayGamepad = 0;
select_xx = 0;
select_yy = 0;
select_scale = 1;
destroy_delay = 0;
able_axis = true;
button_initial_yy = [

view_wport[0] * 2, 
-view_wport[0],
view_wport[0] * 2

];

button_yy = [ 

view_wport[0] * 2, 
-view_wport[0],
view_wport[0] * 2

]
button_xscale = [1, 1, 1];
button_yscale = [0, 0, 0];

able = true;
able_count = 0;
chose = false;
shake(1, .1);

depth = -9;

ps = part_system_create();
pt = part_type_create();
pe = part_emitter_create(ps);

part_time = 40;

part_system_automatic_draw(ps, false);


event_user(0);
event_user(2);

event_user(1);

