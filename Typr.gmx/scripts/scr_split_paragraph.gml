//Get paragraph and split it into a 1 dimensional array and return it
var sub_string = "";
var sub_array;
var j = 0;
for (var i = 1; i<=string_length(argument0)+1; i++)
{
    var sub_char = string_char_at(argument0,i);
    if (sub_char != " " && i<=string_length(argument0))
    {
        sub_string = sub_string + sub_char;
    }
    else
    {
        if (sub_char == " ")
        sub_string = sub_string + sub_char;
        sub_array[j] = sub_string;
        sub_string = "";
        j++;
    }
}

return sub_array;
    
