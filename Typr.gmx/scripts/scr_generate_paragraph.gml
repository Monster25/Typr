
switch(argument0)
{
case 0:
{
var pool = quotes;
var index = irandom_range(0,array_height_2d(pool)-1);
var s = pool[index,0];
}
break;
case 1:
var b = irandom_range(0,1);
if (b == 0)
{
var pool = quotes;
var index = irandom_range(0,array_height_2d(pool)-1);
var s = pool[index,0];
}
else
{
var pool = artistic;
var index = irandom_range(0,array_height_2d(pool)-1);
var s = pool[index,0];
}
break;
case 2:
var b = irandom_range(0,2);
if (b == 0)
{
var pool = quotes;
var index = irandom_range(0,array_height_2d(pool)-1);
var s = pool[index,0];
}
else if (b == 1)
{
var pool = artistic
var index = irandom_range(0,array_height_2d(pool)-1);
var s = pool[index,0];
}
else if (b == 2)
{
var pool = academic
var index = irandom_range(0,array_height_2d(pool)-1);
var s = pool[index,0];
}
break;
default:
break;
}
obj_game_control.paragraph_index = index;
obj_game_control.paragraph_pool = pool;
return s;
