if(instance_number(obj_global) > 1) {
	instance_destroy();
	exit;
}
// Global variables ---------------------------------------------------

global.pause = false;
global.current_time = 0;

// --------------------------------------------------------------------



// Controllers

global.musicVolume = .6;
global.soundsVolume = 1;
global.activate_achievements = [];


// ----------------------------------------------------------------------



// Event User ------------------------------------------------------------

event_user(0);
event_user(1);
event_user(2);
event_user(3);

// -----------------------------------------------------------------------

//audio_group_load(audiogroup1);
//audio_group_load(audiogroup2);