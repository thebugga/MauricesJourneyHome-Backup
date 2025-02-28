function swap_is_player2() //gml_Script_swap_is_player2
{
    return (global.swapmode && global.playerCharacter == Characters.Maurice);
}

function swap_player(argument0, argument1) //gml_Script_swap_player
{
    if (argument0 == undefined)
        argument0 = false
    if (argument1 == undefined)
        argument1 = false
    if global.swapmode
    {
        if argument0
            global.swap_boss_damage = -1
        state = states.normal
        if global.playerCharacter == Characters.Maurice
        {
            if global.playerCharacter == Characters.Pierre
            {
                scr_switchpeppino()
                noisecrusher = true
            }
            if global.noisejetpack
                noisepizzapepper = true
            else if (global.leveltosave == "freezer")
                global.noisejetpack = true
        }
        var og_player = global.playerCharacter
		global.playerCharacter = global.playerFollowCharacter
		global.playerFollowCharacter = og_player
		player_index = !player_index
        if global.playerCharacter == Characters.Maurice
        {
            if noisecrusher
            {
                noisecrusher = false
                scr_switchgustavo(true, false)
            }
            if (global.noisejetpack && (!noisepizzapepper))
                global.noisejetpack = false
        }
        if global.playerCharacter == Characters.Doise
            tauntstoredisgustavo = false
        scr_characterspr()
        pistolcharge = 0
        pistolchargeshooting = false
        pistolanim = -4
        global.pistol = false
        with (obj_gustavoswitch)
        {
            x = xstart
            y = ystart
            create_particle(x, y, (9 << 0))
            var _esc = escape
            event_perform(ev_create, 0)
            escape = _esc
        }
        with (obj_peppinoswitch)
        {
            x = xstart
            y = ystart
            create_particle(x, y, (9 << 0))
            _esc = escape
            event_perform(ev_create, 0)
            escape = _esc
            event_perform(ev_other, ev_room_start)
        }
        with (obj_playerbomb)
        {
            dead = true
            instance_destroy(id)
        }
        with (obj_swapmodefollow)
        {
            taunttimer = 0
            if global.playerCharacter == Characters.Maurice
            {
                global.playerCharacter = Characters.Doise
            }
            self.get_character_spr()
        }
        with (obj_tv)
        {
            if (state != states.transitioncutscene && (!argument0))
            {
                state = states.normal
                if (idleanim < 60)
                    idleanim = 60
                sprite_index = (global.playerCharacter == Characters.Maurice ? spr_tv_idle : spr_tv_idleN)
                if (sprite_index == spr_tv_idle && other.global.playerCharacter == Characters.Pierre)
                    sprite_index = spr_tv_idleG
                //tv_get_palette()
            }
        }
        return true;
    }
    return false;
}

