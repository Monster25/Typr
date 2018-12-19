switch (mpos)
{
    case 0:
    {
        with(obj_game_control)
        state_switch("classic")
        if (room_exists(asset_get_index("rm_level")))
        {
            room_goto(asset_get_index("rm_level"));
        }  
        break;
    }
    case 1:
    {
        with(obj_game_control)
        state_switch("gibbrsh");
        if (room_exists(asset_get_index("rm_level")))
        {
            room_goto(asset_get_index("rm_level"));
        }  
        break;
    }
    case 2:
    {
        game_end();
        break;
    }
default: break;
}
