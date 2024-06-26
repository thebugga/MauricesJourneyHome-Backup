function scr_maurice_punch() //gml_Script_scr_player_punch
{
        switch character
        {
            case "M":
                landAnim = true
                jumpstop = false
                image_speed = 0.4
                hsp = xscale - movespeed
                move = key_right - key_left
                movespeed = 13 * -image_xscale 
                var _kungfuground = (sprite_index == spr_player_kungfu1 || sprite_index == spr_player_kungfu2 || sprite_index == spr_player_kungfu3)

                if (_kungfuground && image_index > 7 && (!key_attack) && movespeed > 0)
                    movespeed -= 0.5
                if (floor(image_index) == (image_number - 1))
                {
                    switch sprite_index
                    {
                        case spr_player_kungfu1:
                        case spr_player_kungfu2:
                        case spr_player_kungfu3:
                            break
                        case spr_player_kungfuair1transition:
                            sprite_index = spr_player_kungfuair1
                            break
                        case spr_player_kungfuair2transition:
                            sprite_index = spr_player_kungfuair1transition
                            break
                        case spr_player_kungfuair3transition:
                            sprite_index = spr_player_kungfuair3
                            break
                    }

                }
                if ((!_kungfuground))
                {
                    if (grounded && vsp >= 0)
                        state = states.normal
                }if (sprite_index != spr_player_kungfujump && place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + xscale), y, obj_destructibles))) && (!(place_meeting((x + xscale), y, obj_slope))))
                {
                    vsp = -4
                    sprite_index = spr_player_kungfujump
                    image_index = 0
                    state = states.punch
                    movespeed = -6
                }
                    with (create_mach3effect(x, y, sprite_index, image_index, true))
                    {
                        image_xscale = other.xscale
                        playerid = other.id
                    }
                }

                    if (floor(image_index) == image_number - 1){
                        state = states.normal
						sprite_index = spr_idle
					}
}

