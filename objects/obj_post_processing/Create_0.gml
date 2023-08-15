ppfx_application_render_init();

ppfx_id = ppfx_create();

var effects = [
	new pp_bloom(true,,, 1.5)
]

ppfx_profile = ppfx_profile_create("Main", effects);

ppfx_profile_load(ppfx_id, ppfx_profile);



shockwave_id = shockwave_create();


vig_intense = 0;

