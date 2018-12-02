//Player starts new mode
if (state_new)
{
    //Reset vars
    scr_reset_input(player_input);
    display_word = "";
    time = 0;
    best_score = 0;
    word_count = 0;
    letter_count_correct = 0;
    current_difficulty_gibbrsh = 0;
    limiter = 0;
    comboer = 0;
    //Reset misc vars
    i = -1;
    j = -1;
    //Generate display word
    display_word = scr_generate_word(letter_limits[limiter,0],letter_limits[limiter,1],limiter);
    //Set timer
    time = initial_time_gibbrsh;
}

//Get Player input
scr_player_input();
//Escape to go back to menu
if (esc)
{
state_switch("menu");
if (room_exists(room_previous(room)))
room_goto_previous();
}

//If time is up go back to menu
if (time <= 0)
{
state_switch("menu");
if (room_exists(room_previous(room)))
room_goto_previous();
}

//Player input update
//player_input = keyboard_string;

//Time moving
time-=1/room_speed;

//Combo checker
if (color == c_red)
{
comboer = 0;
correct_string = "";
letter_count_correct = 0;
ok = 0;
}
else if (color == c_green && ok == 1)
{
z = string_length(player_input);
letter_count_correct += 1;
ok = 0;
}

if (string_length(player_input)>z)
ok = 1;

//Constant word checker, checks input and changes color accordingly
if (string_length(player_input) == 0)
color = c_white;

if (j == -1 && string_length(player_input)>0 && string_char_at(player_input,string_length(player_input))!=string_char_at(display_word,string_length(player_input)))
{
color = c_red;
j = string_length(player_input)-1;
}
else if (string_length(player_input)>0 && j == -1)
{
color = c_green;
j = -1;
}

if (string_length(player_input) <= j)
j = -1;

//Change limits when word count gets high enough
if (word_count >= letter_limits[limiter,2] && limiter<array_height_2d(letter_limits)-1)
limiter++;

//Change combo when letter count gets high enough
if (letter_count_correct >= letter_combo[comboer,0] && comboer<array_height_2d(letter_combo)-1)
comboer++;

//Correct word
if (player_input == display_word)
{
//Add word count
word_count++;
//Reset input and true input
scr_reset_input(player_input);
//Add score + combo modifier
best_score+=time*letter_combo[comboer,1];
//add gain to current time
time += time_gain_gibbrsh*(string_length(display_word)-1);
//Reset misc vars
i = -1;
//Generate new word
display_word = scr_generate_word(letter_limits[limiter,0],letter_limits[limiter,1],limiter);
}




