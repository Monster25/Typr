if (state_new)
{
color_combo = scr_random_bg_color(bg_colors);
background_color = bg_colors[color_combo,0];

    //Sounds and Music
    if (!audio_is_playing(obj_sound.music_01))
    audio_play_sound(obj_sound.music_01,1,1);
}

scr_player_input();
if (esc)
game_end();
