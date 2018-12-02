//Player starts new mode
if (state_new)
{
    //Reset vars
    scr_reset_input(player_input);
    display_word = "";
    time = 0;
    best_score = 0;
    current_paragraph = 0;
    //Reset misc vars
    i = -1;
    j = -1;
    current_word = 0;
    //Split paragraph into an array of words
    words = scr_split_paragraph(paragraphs[current_paragraph]);
    //Display initial word;
    display_word = words[current_word];
    //Set timer
    time = 15;
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

//Correct word

if (player_input == display_word)
{
//Reset input and true input
scr_reset_input(player_input);
//Add score
best_score+=time;
//add gain to current time
time += time_gain_classic*(string_length(display_word)-1);
//Reset misc vars
i = -1;
//Go to next word aslong as there is enough paragraph left
if (current_word < array_length_1d(words)-1)
{
current_word++;
display_word = words[current_word];
}
//If not then go to next paragraph and split it
else if (current_paragraph < array_length_1d(paragraphs)-1)
{
current_paragraph++;
//reset current word
current_word = 0;
//Split paragraph into an array of words
words = scr_split_paragraph(paragraphs[current_paragraph]);
//Display initial word;
display_word = words[current_word];
}
//Else go back to menu
else
{
state_switch("menu");
if (room_exists(room_previous(room)))
room_goto_previous();
}
}



