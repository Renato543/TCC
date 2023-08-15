// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function audio_pitch_variation(audio, priority, loop, volume = 1, min_pitch = .9, max_pitch = 1.1, reverb = true){

	if(reverb) {
		return audio_play_sound_on(obj_game.reverb_emitter, audio, loop, priority, volume, 0, random_range(min_pitch, max_pitch));
	}
	else { 
		return audio_play_sound(audio, priority, loop, volume, 0, random_range(min_pitch, max_pitch));	
	}
}