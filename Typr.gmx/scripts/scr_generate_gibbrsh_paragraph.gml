//Generate gibbrsh paragraph
var nr = irandom_range(argument0[argument1, 3],argument0[argument1,4]);
var s = "";
for (var i = 1; i <= nr; i++)
{
if (i < nr)
    s+=scr_generate_word(letter_limits, limiter)+" ";
else
    s+=scr_generate_word(letter_limits, limiter);
}
    return s;

