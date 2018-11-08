var alphabet = "abcdefghijklmnopqrstuvwxyz";
var j = irandom_range(argument0,argument1);
var s = "";
for (var i = 1;i<=j;i++)
{
var m = irandom_range(1,string_length(alphabet));
s = string_insert(string_char_at(alphabet,m),s,i);
}

return s;
