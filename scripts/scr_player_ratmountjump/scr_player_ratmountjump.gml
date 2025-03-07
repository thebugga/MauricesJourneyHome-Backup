function scr_player_ratmountjump() //gml_Script_scr_player_ratmountjump
{
    move = (key_left + key_right)
    if (sprite_index == spr_lonegustavo_dashjump)
        image_speed = 0.6
    else
        image_speed = 0.35
    if ((!jumpstop) && vsp < 0.5 && (!key_jump2))
    {
        vsp /= 10
        jumpstop = 1
    }
    hsp = movespeed
    var r = ratmount_movespeed
    if ((place_meeting((x + Xscale), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || (abs(movespeed) < 8 && move != Xscale) || abs(movespeed) <= 6)
    {
        gustavodash = 0
        ratmount_movespeed = 8
    }
    if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && gustavodash != 51)
    {
        movespeed = 0
        if (r >= 12)
        {
            var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
            if _bump
            {
                event_play_oneshot_3d("event:/sfx/maurice/groundpound", x, y)
                state = states.bump
                if brick
                    sprite_index = spr_player_ratmountbump
                else
                    sprite_index = spr_lonegustavo_bump
                image_index = 0
                hsp = ((-Xscale) * 4)
                vsp = -5
                with (obj_camera)
                {
                    shake_mag = 4
                    shake_mag_acc = (5 / room_speed)
                }
                return;
            }
        }
    }
    if (gusdashpadbuffer > 0)
        gusdashpadbuffer--
    if (gusdashpadbuffer <= 0)
    {
        if (move != 0)
        {
            if (move == Xscale)
                movespeed = approach(movespeed, (Xscale * ratmount_movespeed), 0.5)
            else if (gustavodash == 51)
                movespeed = approach(movespeed, 0, 0.5)
            else
                movespeed = approach(movespeed, 0, 0.5)
        }
        else if (gustavodash == 51)
            movespeed = approach(movespeed, 0, 0.5)
        else
            movespeed = approach(movespeed, 0, 0.5)
        if (move != Xscale && move != 0)
        {
            ratmount_movespeed = 8
            Xscale = move
        }
    }
    if (gusdashpadbuffer > 0 && movespeed != 0)
        Xscale = sign(movespeed)
    if (jumpAnim && animation_end())
    {
        jumpAnim = 0
        switch sprite_index
        {
            case spr_lonegustavo_jumpstart:
                sprite_index = spr_lonegustavo_jump
                break
            case spr_lonegustavo_dashjump:
                sprite_index = spr_lonegustavo_dashjump
                break
            case spr_player_ratmountgroundpound:
                sprite_index = spr_player_ratmountgroundpoundfall
                break
            case spr_player_ratmountjump:
                sprite_index = spr_player_ratmountfall
                break
            case spr_player_ratmountjump2:
                sprite_index = spr_player_ratmountfall2
                break
            case spr_player_ratmountballoonend2:
                sprite_index = spr_player_ratmountballoonend3
                break
            case spr_player_ratmountmushroombounce:
                jumpAnim = 1
                image_index = (image_number - 1)
                break
            case spr_player_ratmountballoonend1:
                if (vsp > 0)
                {
                    jumpAnim = 1
                    sprite_index = spr_player_ratmountballoonend2
                }
                else
                    jumpAnim = 1
                break
        }

    }
    if scr_check_groundpound()
    {
        if brick
        {
            with (instance_create(x, y, obj_brickcomeback))
            {
                playerid = other.id
				ispeetzy = other.riderispeetzy
				wait = 1
                instance_create(x, y, obj_genericpoofeffect)
            }
        }
        brick = 0
        movespeed = hsp
        state = states.ratmountgroundpound
        image_index = 0
        sprite_index = spr_lonegustavo_groundpoundstart
    }
    if (((input_buffer_slap > 0 && key_up) || key_shoot2) && brick && !riderispeetzy)
    {
        input_buffer_slap = 0
        ratmount_kickbrick()
    }
    if (input_buffer_slap > 0 && (!key_up))
    {
        input_buffer_slap = 0
		if !brick
		{
			particle_set_scale((5 << 0), Xscale, 1)
	        create_particle(x, y, (5 << 0), 0)
	        input_buffer_slap = 0
	        if (brick == 1)
	        {
	            with (instance_create(x, y, obj_brickcomeback))
				{
					playerid = other.id
					ispeetzy = other.riderispeetzy
	                wait = 1
				}
	        }
	        brick = 0
	        state = states.ratmountpunch
	        gustavohitwall = 0
	        ratmountpunchtimer = 25
	        image_index = 0
	        if (move != 0)
	            Xscale = move
	        movespeed = (Xscale * 12)
	        sprite_index = spr_lonegustavo_punch
		}
		else
		{
			if riderispeetzy
			{
				if (ratgrabbedID != noone)
		        {
		            state = states.ratmountspit
		            sprite_index = spr_player_ratmountspit
		            image_index = 0
		        }
		        else
		        {
		            state = states.ratmountattack
		            movespeed = 10
		            sprite_index = spr_player_ratmountattack
		            image_index = 0
		        }
			}
		}
    }
    var bounce = 1
    if (input_buffer_jump > 0 && can_jump && gusdashpadbuffer == 0 && (!(place_meeting(x, (y + 5), obj_grindrail))))
    {
        bounce = 0
        input_buffer_jump = 0
        particle_set_scale((4 << 0), Xscale, 1)
        create_particle(x, y, (4 << 0), 0)
        scr_fmod_soundeffect(jumpsnd, x, y)
        if brick
        {
            if (ratmount_movespeed >= 12 && key_attack)
                sprite_index = spr_player_ratmountdashjump
            else if riderispeetzy && ratgrabbedID != noone
				sprite_index = spr_player_ratmountjump2
            else
                sprite_index = spr_player_ratmountjump
        }
        else if (ratmount_movespeed >= 12 && key_attack)
            sprite_index = spr_lonegustavo_dashjump
        else
            sprite_index = spr_player_ratmountgroundpound
        image_index = 0
        jumpAnim = 1
        state = states.ratmountjump
        vsp = -11
        jumpstop = 0
    }
    if (key_jump && brick && bounce)
    {
		if riderispeetzy && ratgrabbedID == noone
		{
			state = states.ratmountgroundpound
	        sprite_index = spr_lonegustavo_jumpstart
	        image_index = 0
	        image_speed = 0.35
	        gustavokicktimer = 2
	        brick = false
	        with (instance_create((x - Xscale * 10), (y + 60), obj_ratmountgroundpound))
	        {
	            playerid = other.id
				image_xscale = other.Xscale
	            image_index = 0
	        }
		}
		else if !riderispeetzy
		{
	        GamepadSetVibration(0, 0.8, 0.8, 0.65)
	        state = states.ratmountbounce
	        instance_create(x, y, obj_highjumpcloud2)
	        sprite_index = spr_player_ratmountwalljump
	        image_index = 0
	        vsp = -16
		}
    }
    if (grounded && vsp > 0 && sprite_index != spr_lonegustavo_kick)
    {
        doublejump = 0
        create_particle(x, y, (12 << 0), 0)
        state = states.ratmount
        landAnim = 1
        jumpstop = 0
        if (brick && (!key_attack) && ratgrabbedID == noone)
            sprite_index = spr_player_ratmountland
        else
            landAnim = 0
        image_index = 0
    }
    with (ratgrabbedID)
        scr_enemy_ratgrabbed()
    ratmount_shootpowerup()
    ratmount_dotaunt()
}

