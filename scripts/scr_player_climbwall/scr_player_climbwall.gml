function scr_player_climbwall()
{
	if (windingAnim < 200)
	    windingAnim++
	if (sprite_index != spr_player_clingwall)
	vsp = -movespeed
	movespeed -= 0.25
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
	    instance_create(x, y, obj_jumpdust)
	    vsp = 0
	    mach2 = 35
	    state = states.mach2
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
	if (movespeed <= 0)
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
