switch (mpos)
{
    case 0:
    {
        obj_game_control.mode_to_play = 0;
        
        /*
        with(obj_game_control)
        state_switch("classic")
        if (room_exists(asset_get_index("rm_level")))
        {
            room_goto(asset_get_index("rm_level"));
        }  
        break;
        */
        //with(obj_game_control)
        //state_switch("classic")
        
        if (room_exists(asset_get_index("rm_tutorial")))
        {
            scr_fade_outin(3,"rm_tutorial");
            //room_goto(asset_get_index("rm_tutorial"));
        }
        break;
    }
    case 1:
    {
        obj_game_control.mode_to_play = 1;
        /*
        with(obj_game_control)
        state_switch("gibbrsh");
        if (room_exists(asset_get_index("rm_level")))
        {
            room_goto(asset_get_index("rm_level"));
        }  
        break;
        */
        if (room_exists(asset_get_index("rm_tutorial")))
        {
            scr_fade_outin(3,"rm_tutorial");
            //room_goto(asset_get_index("rm_tutorial"));
        }
        break;
    }
    case 2:
    {
    if (room_exists(asset_get_index("rm_credits")))
    {
        scr_fade_outin(3,"rm_credits");
    }
    break;
    }
    case 3:
    {
        game_end();
        break;
    }
default: break;
}
