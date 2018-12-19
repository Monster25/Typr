switch(argument0)
{
case 0:
var s = quotes[irandom_range(0,array_height_2d(quotes)-1),0];
break;
case 1:
var b = irandom_range(0,1);
if (b == 0)
var s = quotes[irandom_range(0,array_height_2d(quotes)-1),0];
else
var s = artistic[irandom_range(0,array_height_2d(artistic)-1),0];
break;
case 2:
var b = irandom_range(0,2);
if (b == 0)
var s = quotes[irandom_range(0,array_height_2d(quotes)-1),0];
else if (b == 1)
var s = artistic[irandom_range(0,array_height_2d(artistic)-1),0];
else if (b == 2)
var s = academic[irandom_range(0,array_height_2d(academic)-1),0];
break;
default:
break;
}

return s;
