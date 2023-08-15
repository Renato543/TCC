// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function destroy_particle_system(ps, pt, pe){
	part_type_destroy(pt);
	part_emitter_destroy(ps, pe);
	part_system_destroy(ps);
}