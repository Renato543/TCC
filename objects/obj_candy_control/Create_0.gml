iid = items.candy;

candy_quant = 0;

candy_delay = 6;
delay_count = 0;
candy_quant_max = 3;
level = 1;

ps = part_system_create();
pt = part_type_create();
pe = part_emitter_create(ps);

part_system_automatic_draw(ps, false);