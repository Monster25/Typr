if (state_new)
{
color_combo = scr_random_bg_color(bg_colors);
background_color = bg_colors[color_combo,0];
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




