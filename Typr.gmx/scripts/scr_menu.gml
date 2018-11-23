switch (mpos)
{
    case 0:
    {
        with(obj_game_control)
        state_switch("classic");
        room_goto_next();   
        break;
    }
    case 1:
    {
        with(obj_game_control)
        state_switch("gibbrsh");
        room_goto_next();
        break;
    }
    case 2:
    {
        game_end();
        break;
    }
default: break;
}
