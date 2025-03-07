function scr_switchgustavo(argument0, argument1) //gml_Script_scr_switchgustavo
{
    if (argument0 == undefined)
        argument0 = true
    if (argument1 == undefined)
        argument1 = false
    with (obj_player1)
    {
        if global.playerCharacter == Characters.Maurice
        {
            ratmount_movespeed = 8
            gustavodash = 0
            global.playerCharacter = Characters.Pierre
            if argument0
            {
                visible = true
                state = states.ratmount
                sprite_index = spr_player_ratmountidle
                jumpAnim = false
            }
            brick = true
            fmod_studio_event_instance_release(snd_voiceok)
            snd_voiceok = fmod_createEventInstance("event:/sfx/voice/gusok")
        }
    }
    with (obj_swapmodefollow)
    {
        global.playerCharacter = Characters.Pierre
        self.get_character_spr()
    }
}

function scr_switchpeppino(argument0) //gml_Script_scr_switchpeppino
{
    if (argument0 == undefined)
        argument0 = true
    with (obj_player1)
    {
        if global.playerCharacter == Characters.Maurice
        {
            gustavodash = 0
            ratmount_movespeed = 8
            brick = false
            fmod_studio_event_instance_release(snd_voiceok)
            snd_voiceok = fmod_createEventInstance("event:/sfx/voice/ok")
            if argument0
            {
                visible = true
                state = states.normal
                jumpAnim = false
                sprite_index = spr_player_idle
            }
        }
        else
        {
            noisecrusher = false
            if argument0
            {
                jumpAnim = false
                sprite_index = spr_idle
                visible = true
                state = states.normal
            }
        }
    }
    with (obj_swapmodefollow)
    {
        self.get_character_spr()
    }
}

