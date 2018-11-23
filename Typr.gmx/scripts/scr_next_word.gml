//Creates next word from paragraph argument 1 and returns the word and sets the index for next time it is ran

if (argument2 = noone)



for (var i = argument1;i<=string_length(argument0);i++)
if (string_char_at(argument0,i+1) == (" "))
{
var s = string_copy(argument0, argument1, i);
word_index = i+2;
return s;
}


