function scr_dotaunt() //gml_Script_scr_dotaunt
{
    if ((key_taunt2 || input_finisher_buffer > 0 || (state == states.backbreaker && key_up && supercharged)) && (!skateboarding))
    {
        input_finisher_buffer = 0
        pistolanim = -4
        flash = 0
        if (((!key_up) || (!supercharged)) && global.tauntcount < 10 && place_meeting(x, y, obj_exitgate) && (global.panic == 1 || instance_exists(obj_wartimer)) && global.combotime > 0)
        {
            global.tauntcount++
            global.collect += 25
            with (instance_create((x + 16), y, obj_smallnumber))
                number = string(25)
            create_collect(x, y, spr_taunteffect, 25)
            scr_sound_multiple("event:/sfx/misc/collect", x, y)
        }
        if (!finisher)
        {
            taunttimer = 20
            if (state != states.backbreaker && sprite_index != spr_supertaunt1 && sprite_index != spr_supertaunt2 && sprite_index != spr_supertaunt3 && sprite_index != spr_supertaunt4)
            {
                tauntstoredmovespeed = movespeed
                tauntstoredvsp = (vsp + grav)
                tauntstoredsprite = sprite_index
                tauntstoredstate = state
            }
            state = states.backbreaker
            if (supercharged && key_up)
            {
                ini_open_from_string(obj_savesystem.ini_str)
                ini_write_real("Game", "supertaunt", 1)
                obj_savesystem.ini_str = ini_close()
                event_play_oneshot_3d("event:/sfx/maurice/supertaunt", x, y)
                image_index = 0
                sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4)
            }
            else
            {
                scr_create_parryhitbox()
                event_play_oneshot_3d("event:/sfx/maurice/taunt", x, y)
                taunttimer = 20
                sprite_index = spr_taunt
                image_index = random_range(0, 11)
            }
            with (instance_create(x, y, obj_taunteffect))
                player = other.id
        }
    }
}

function scr_create_parryhitbox() //gml_Script_scr_create_parryhitbox
{
    parrytimer = taunt_to_parry_max
    instance_destroy(parry_inst)
    parry_inst = instance_create(x, y, obj_parryhitbox)
    var _playerid = 0
    if (object_index == obj_player2)
        _playerid = 1
    with (parry_inst)
    {
        player_id = _playerid
        image_xscale = other.Xscale
    }
}

