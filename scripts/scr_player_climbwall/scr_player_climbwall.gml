function scr_player_climbwall()
{
	if (windingAnim < 200)
	    windingAnim++
    vsp = -wallspeed
	    if (wallspeed < 20)
	        wallspeed += 0.15
	    if (wallspeed < 0)
	    {
	        if (mach4mode == false)
	            movespeed += 0.2
	        else
	            movespeed += 0.4
	    }
	mach2 = 35
	crouchslideAnim = true
	if (vsp < -5)
	sprite_index = spr_machclimbwall
	else
	sprite_index = spr_player_clingwall
	if (!key_attack)
	{
	    state = states.jump
	    sprite_index = spr_player_fall
	}
	if (!(scr_solid((x + xscale), y)))
	{
	    if global.playerCharacter == Characters.Maurice
		{
			instance_create(x, y, obj_jumpdust)
		    vsp = 0
		    mach2 = 35
			movespeed = wallspeed
		    state = states.mach2
		}
		else if global.playerCharacter == Characters.Doise
	    {
	        with (instance_create(x, y, obj_noiseeffect))
	            sprite_index = spr_noisewalljumpeffect
	        sprite_index = spr_playerN_wallbounce
	        state = states.machcancel
	        savedmove = xscale
	        hsp = 0
	        movespeed = 0
	        image_index = 0
	    }
	}
	if (vsp == 15)
	{
	    vsp += 2
	}
	if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles))
		{
			sprite_index = spr_superjumpland;
			fmod_event_one_shot_3d("event:/sfx/maurice/groundpound", x, y);
			image_index = 0;
			state = states.Sjumpland;
			machhitAnim = false;
		}
	if (wallspeed <= 0)
	{
	    state = states.jump
	    sprite_index = spr_machfreefall
	}
	image_speed = 0.6
	if (!instance_exists(obj_cloudeffect))
	    instance_create(x, (y + 43), obj_cloudeffect)
	if (key_jump && key_attack)
	{
	    instance_create(x, y, obj_jumpdust)
		movespeed = 10
	    mach2 = 35
	    vsp = -9
	    state = states.mach2
	    xscale *= -1
	}
}
