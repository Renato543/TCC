// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function damage_sound(){
	if(array_length(global.enemy_hit_audio) < 5) { 
		array_insert(global.enemy_hit_audio, array_length(global.enemy_hit_audio), audio_pitch_variation(snd_hit, 50, false, .4));
	}
}