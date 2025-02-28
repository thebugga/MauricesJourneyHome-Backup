function scr_player_ratmountcrouch() //gml_Script_scr_player_ratmountcrouch
{
    Move = (key_left + key_right)
    hsp = Movespeed
    if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_destructibles))))
        Movespeed = 0
    if (Move != 0)
    {
        if (Move == xscale)
        {
            if (abs(Movespeed) < 4)
                Movespeed = approach(Movespeed, (xscale * 4), 0.5)
            else
                Movespeed = approach(Movespeed, (xscale * 4), 0.1)
        }
        else
        {
            Movespeed = approach(Movespeed, 0, 0.5)
            if (abs(Movespeed) <= 0)
                xscale = Move
        }
        if (abs(Movespeed) < 3 && Move != 0)
            image_speed = 0.35
        else if (abs(Movespeed) > 3 && abs(Movespeed) < 6)
            image_speed = 0.45
        else
            image_speed = 0.6
    }
    else
        Movespeed = approach(Movespeed, 0, 0.5)
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

