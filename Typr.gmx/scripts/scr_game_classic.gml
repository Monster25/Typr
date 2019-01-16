//Player starts new mode
if (state_new)
{

    //Reset vars
    scr_reset_input(player_input);
    display_word = "";
    time = 0;
    obj_gui.pg = 0;
    real_time = 0;
    best_score = 0;
    best_letter_count = 0;
    letter_count_correct = 0;
    word_count = 0;
    current_paragraph = 0;
    paragraph_count = 0;
    comboer = 0;
    difficulty_changer_classic = 0;
    color_combo = scr_random_bg_color(bg_colors);
    background_color = bg_colors[color_combo,0];
    //Reset scoreboard vars
    final_words = 0;
    final_combo = 0;
    final_score = 0;
    //Reset misc vars
    i = -1;
    j = -1;
    ok = 1;
    z = -1;
    current_word = 0;
    //generate paragraph
    current_paragraph = scr_generate_paragraph(difficulty_changer_classic);
    
    //Split paragraph into an array of words
    words = scr_split_paragraph(current_paragraph);
    //Display initial word;
    display_word = words[current_word];
    //Set timer
    time = initial_time_classic;
    
    //Stop music
    if (audio_is_playing(obj_sound.music_01))
    audio_stop_sound(obj_sound.music_01);
    
    //audio_group_set_gain(soundeffects,0.5,0.1);
}
//Play music
if (!audio_is_playing(obj_sound.music_02))
audio_play_sound(obj_sound.music_02,1,1);
//Get Player input
scr_player_input();
//Escape to go back go to menu
if (esc)
{
if (room_exists(asset_get_index("rm_menu")))
{
room_goto(asset_get_index("rm_menu"));
state_switch("menu");
}
}

//If time is up go to scoreboard
if (time <= 0)
{
final_combo = best_letter_count;
final_words = word_count;
final_score = best_score;
if(room_exists(room_next(room)))
{
room_goto_next();
state_switch("scoreboard");
}
}

//Time moving
time-=1/room_speed;
real_time+=1/room_speed;

//Player input update
//player_input = keyboard_string;



//Letter Combo checker
if (color == c_red)
{
comboer = 0;
letter_count_correct = 0;
ok = 0;
}
else if (color == c_green && ok == 1)
{
z = string_length(player_input);
letter_count_correct += 1;
if (letter_count_correct > best_letter_count)
best_letter_count = letter_count_correct;
ok = 0;
}

if (string_length(player_input)>z)
ok = 1;

//Constant word checker, checks input and changes color accordingly
if (string_length(player_input) == 0)
color = c_white;

if (j == -1 && string_length(player_input)>0 && string_char_at(player_input,string_length(player_input))!=string_char_at(display_word,string_length(player_input)))
{
//audio_play_sound(obj_sound.incorrect_word,1,0)
color = c_red;
if(comboer!=0)
scr_float_text(round(global.displayWidth/2),round(global.displayHeight/2-global.displayHeight/6),0.5,80,"!!RESET!!",1);
j = string_length(player_input)-1;
}
else if (string_length(player_input)>0 && j == -1)
{
color = c_green;
j = -1;
}


if (string_length(player_input) <= j)
j = -1;

if (color == c_red && any_key && !bk_space)
{
if (!audio_is_playing(obj_sound.incorrect_word))
//audio_stop_sound(obj_sound.incorrect_word);

audio_play_sound(obj_sound.incorrect_word,1,0);
}

//Change combo when letter count ge ts high enough
if (letter_count_correct > letter_combo[comboer,0] && comboer<array_height_2d(letter_combo)-1)
{
comboer++;

scr_float_text(round(global.displayWidth/2),round(global.displayHeight/2-global.displayHeight/4),0.5,80,"x"+string(comboer+1),0);
}

//Correct word
if (player_input == display_word)
{
//Floating animation
//scr_float_text(round(global.displayWidth/2-string_width(current_paragraph)/2+obj_gui.relative_distance[current_word]+string_width(words[current_word])/2-string_width(" ")),round(global.displayHeight/2-string_height(words[current_word])),0.5,40,time_gain_classic*string_length(words[current_word]),0);
scr_float_text(round(global.displayWidth/2-string_width(current_paragraph)/2+obj_gui.relative_distance[current_word]+string_width(words[current_word])/2-string_width(" ")),round(global.displayHeight/2-string_height(words[current_word])),0.5,80,"+ "+string(letter_score_classic*string_length(words[current_word])*letter_combo[comboer,1]),0);
//Sound effect
if (current_word != array_length_1d(words)-1)
{
var sound = audio_play_sound(obj_sound.correct_word,1,0);
audio_sound_pitch(sound,1+((current_word)/50));
}
//Add word count
word_count++;
//Reset input and true input
scr_reset_input(player_input);

//Add score
best_score+=letter_score_classic*string_length(words[current_word])*letter_combo[comboer,1];
//add gain to current time
//time += time_gain_classic*(string_length(display_word)-1);
//Reset misc vars
i = -1;
//Go to next word aslong as there is enough paragraph left
if (current_word < array_length_1d(words)-1)
{
current_word++;
display_word = words[current_word];
}
//If not then go to next paragraph and split it
else
{
//Change bg color
color_combo = scr_random_bg_color(bg_colors);
background_color = bg_colors[color_combo,0];
//Increase paragrahp count
paragraph_count++;
//reset current word
current_word = 0;
//Sound effect
audio_play_sound(obj_sound.correct_paragraph,1,0);
//generate paragraph
current_paragraph = scr_generate_paragraph(difficulty_changer_classic);
//Split paragraph into an array of words
words = scr_split_paragraph(current_paragraph);
//Display initial word;
display_word = words[current_word];
}
//Change difficulty as you progress in paragraphs
if (paragraph_count == difficulty_ceiling_classic[difficulty_changer_classic] && difficulty_changer_classic < 2)
difficulty_changer_classic++;

}



