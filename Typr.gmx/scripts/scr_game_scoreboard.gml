if (state_new)
{

audio_play_sound(obj_sound.scoreboard,1,0);
color_combo = scr_random_bg_color(bg_colors);
background_color = bg_colors[color_combo,0];
//Stop level sound
    if (audio_is_playing(obj_sound.music_02))
    audio_stop_sound(obj_sound.music_02);
}


//Escape to go back to menu
scr_player_input();

if (esc)
{
if (room_exists(asset_get_index("rm_menu")))
{
room_goto(asset_get_index("rm_menu"));
state_switch("menu");
}
}




