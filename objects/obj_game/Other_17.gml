/// @description Audio control
// You can write your code in this editor

for(var i = 0; i < array_length(global.enemy_hit_audio); i++) { 
	if(!audio_is_playing(global.enemy_hit_audio[i])) { 
		array_delete(global.enemy_hit_audio, i, 1);
	}	
}