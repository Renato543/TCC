/// @description XP System
// You can write your code in this editor



if(level > 0) need_xp = level * 50;
if(level > 20) need_xp = level * 70;
if(level > 40) need_xp = level * 90;
if(level > 60) need_xp = level * 110;
if(level > 80) need_xp = level * 130;
if(level >= 100) need_xp = level * 500;




if(xp >= need_xp && !global.levelling_up) { 
	instance_create_layer(0,0, "Instances", obj_levelling);
	level++;
	xp -= need_xp;
	if(xp < 0) xp = 0;
}



