
function scr_doplayernormal(){
	state = states.normal
	sprite_index = spr_idle
	movespeed = 0
	hsp = 0
	vsp = 0
}

function scr_dograb()
{
    input_buffer_slap = 0
    suplexmove = 1
    fmod_event_instance_play(suplexdashsnd)
    if (global.attackstyle == 0)
    {
		if global.playerCharacter == Characters.Maurice
		{
	        input_buffer_slap = 0
	        suplexmove = true
	        fmod_event_instance_play(suplexdashsnd)
	        state = states.handstandjump
	        image_index = 0
			slaphand = 1
			sprite_index = spr_player_lungestart
			movespeed = 10
		}
		else if global.playerCharacter == Characters.Doise
		{
	        input_buffer_slap = 0
	        suplexmove = true
	        fmod_event_instance_play(suplexdashsnd)
	        state = states.handstandjump
			sprite_index = spr_suplexdashjump
	        image_index = 0
			movespeed = 8
		}
    }
    if (global.attackstyle == 1)
    {
        movespeed = 4
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
        movespeed = 8
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
            movespeed = 13
        }
        if grounded
        {
            state = states.punch
            flash = 1
            fmod_event_one_shot_3d("event:/sfx/pep/grabcancel", x, y)
            sprite_index = choose(spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3)
            image_index = 0
            movespeed = 13
        }
    }
    if (global.attackstyle == 3) && ispeppino
        spr_suplexdash = spr_player_attackdash
    else if !(global.attackstyle == 3) && ispeppino
        spr_suplexdash = spr_player_suplexdash
}
