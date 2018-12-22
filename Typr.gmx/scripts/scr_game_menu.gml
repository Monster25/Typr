if (state_new)
{
color_combo = scr_random_bg_color(bg_colors);
background_color = bg_colors[color_combo,0];
}

scr_player_input();
if (esc)
game_end();
