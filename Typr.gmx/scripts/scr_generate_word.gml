//Generates random word using var diff and returns it
switch(argument2)
{
case 0:
var diff = "abcdefghijklmnopqrstuvwxyz";
break;
case 1:
var diff = "0123456789abcdefghijklmnopqrstuvwxyz";
break;
case 2:
var diff = "abcdefghijklmnopqrstuvwxyz012345789`~!@#$%^&*()_+-=[{]}\|;:',<.>/?";
break;
}

var j = irandom_range(argument0,argument1);
var s = "";
for (var i = 1;i<=j;i++)
{
var m = irandom_range(1,string_length(diff));
s = string_insert(string_char_at(diff,m),s,i);
}

return s;
