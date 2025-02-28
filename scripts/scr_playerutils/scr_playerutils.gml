
function scr_doplayernormal(){
	state = states.normal
	sprite_index = spr_idle
	Movespeed = 0
	hsp = 0
	vsp = 0
}

function scr_dograb()
{
    input_buffer_slap = 0
    suplexMove = 1
    fmod_event_instance_play(suplexdashsnd)
    if (global.attackstyle == 0)
    {
		if global.playerCharacter == Characters.Maurice
		{
	        input_buffer_slap = 0
	        suplexMove = true
	        fmod_event_instance_play(suplexdashsnd)
	        state = states.handstandjump
	        image_index = 0
			slaphand = 1
			sprite_index = choose(spr_player_slap1, spr_player_slap2)
			Movespeed = 10
		}
		else if global.playerCharacter == Characters.Doise
		{
	        input_buffer_slap = 0
	        suplexMove = true
	        fmod_event_instance_play(suplexdashsnd)
	        state = states.handstandjump
			sprite_index = spr_suplexdashjump
	        image_index = 0
			Movespeed = 8
		}
    }
    if (global.attackstyle == 1)
    {
        Movespeed = 4
        state = states.tackle
        sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
        image_index = 0
        vsp = -5
    }
    if (global.attackstyle == 2)
        state = states.lungeattack
    if (global.attackstyle == 3)
    {
        sprite_index = spr_suplexdash
        state = states.handstandjump
        Movespeed = 8
        image_index = 0
    }
    if (global.attackstyle == 4)
    {
        if (!grounded)
        {
            tate = (80 << 0)
            flash = 1
            fmod_event_one_shot_3d("event:/sfx/pep/grabcancel", x, y)
            sprite_index = choose(spr_player_kungfuair1, spr_player_kungfuair2, spr_player_kungfuair3)
            image_index = 0
            Movespeed = 13
        }
        if grounded
        {
            state = states.punch
            flash = 1
            fmod_event_one_shot_3d("event:/sfx/pep/grabcancel", x, y)
            sprite_index = choose(spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3)
            image_index = 0
            Movespeed = 13
        }
    }
    if (global.attackstyle == 3) && global.playerCharacter == Characters.Pierre
        spr_suplexdash = spr_player_attackdash
    else if !(global.attackstyle == 3) && global.playerCharacter == Characters.Pierre
        spr_suplexdash = spr_player_suplexdash
}

function slopeCheck(argument0, argument1)
{
    return place_meeting_slope(argument0, argument1 + 1) && !place_meeting_slope(argument0, argument1 + 1) && !place_meeting_slope(argument0, argument1) && place_meeting_slope(argument0, (argument1 - bbox_top) + bbox_bottom);
}

