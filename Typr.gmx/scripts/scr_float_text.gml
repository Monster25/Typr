var anim = instance_create(argument0,argument1,obj_temp_anim);
anim.timer = argument2;
anim.distance = argument3;
//anim.color = argument4;
anim.font = fnt_text_italic;
anim.message = "+ "+string(argument4);
anim.dir = argument5;
anim.alarm[0] = anim.timer*room_speed;
