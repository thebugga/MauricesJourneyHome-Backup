function scr_player_ratmountclimbwall() //gml_Script_scr_player_ratmountclimbwall
{
    image_speed = 0.5
    hsp = 0
    vsp = 0
    if (sprite_index != spr_player_ratmountbounceside)
    {
        sprite_index = spr_player_ratmountbounceside
        image_index = 0
    }
    else if (animation_end())
        image_index = (image_number - 1)
    if ((!grounded) && (!(place_meeting((x + 1), y, obj_solid))) && (!(place_meeting((x - 1), y, obj_solid))))
    {
        state = states.ratmountjump
        jumpAnim = 0
        sprite_index = spr_player_ratmountfall
    }
    if (animation_end())
    {
        if (key_jump2 && input_buffer_jump_negative <= 0)
        {
            state = states.ratmountbounce
            Xscale *= -1
            vsp = -14
            ratmount_fallingspeed = 0
            movespeed = (Xscale * 10)
            event_play_oneshot_3d("event:/sfx/ratmount/walljump2", x, y)
            sprite_index = spr_player_ratmountwalljump
        }
        else
        {
            state = states.ratmountjump
            sprite_index = spr_player_ratmountfall
        }
    }
}

