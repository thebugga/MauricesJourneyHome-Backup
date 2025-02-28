function scr_player_ratmountcrouch() //gml_Script_scr_player_ratmountcrouch
{
    move = (key_left + key_right)
    hsp = movespeed
    if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_destructibles))))
        movespeed = 0
    if (move != 0)
    {
        if (move == Xscale)
        {
            if (abs(movespeed) < 4)
                movespeed = approach(movespeed, (Xscale * 4), 0.5)
            else
                movespeed = approach(movespeed, (Xscale * 4), 0.1)
        }
        else
        {
            movespeed = approach(movespeed, 0, 0.5)
            if (abs(movespeed) <= 0)
                Xscale = move
        }
        if (abs(movespeed) < 3 && move != 0)
            image_speed = 0.35
        else if (abs(movespeed) > 3 && abs(movespeed) < 6)
            image_speed = 0.45
        else
            image_speed = 0.6
    }
    else
        movespeed = approach(movespeed, 0, 0.5)
    if (!grounded)
    {
        state = states.ratmountjump
        jumpAnim = 0
        sprite_index = spr_player_ratmountgroundpoundfall
    }
    if (((grounded && (!key_down)) || brick) && (!(place_meeting_solid(x, (y - 16)))) && (!(place_meeting_solid(x, (y - 32)))))
        state = states.ratmount
    if (hsp != 0)
        sprite_index = spr_lonegustavo_crouchwalk
    else
        sprite_index = spr_lonegustavo_crouch
}

