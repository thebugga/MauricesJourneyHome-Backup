function scr_maurice_mach()
{
	if sprite_index == spr_mach1 || sprite_index == spr_machjump || sprite_index == spr_machjumpfall || sprite_index == spr_walljump || sprite_index == spr_walljumpfall{
		image_speed = 0.35
	}else
		image_speed = 0.45  
	hsp = xscale * movespeed
	if (place_meeting(x + (1 * xscale), y, obj_solid) && (!grounded || groundedSlope))
	{
		wallspeed = movespeed
		state = states.runwall
	}
	if key_down
	{
		state = states.roll
	}
    if (movespeed < 12) && (sprite_index != spr_machjump && sprite_index != spr_machjumpfall) && sprite_index != spr_machturn
    {
		movespeed += 0.1
	}
	if movespeed == 12 && machshit != 6 && (sprite_index != spr_machjump && sprite_index != spr_machjumpfall) && sprite_index != spr_machturn && grounded
	{
		machshit += 0.25
	}
	if machshit == 6
	{
		state = states.mach3
		sprite_index = spr_mach3
	    audio_play_sound(sfx_mach3,10,true)
	    audio_stop_sound(sfx_mach2)
	}
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach1)
		sprite_index = spr_mach
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_machjump)
		sprite_index = spr_machjumpfall
	if !key_run && (sprite_index != spr_machjump || sprite_index != spr_machjumpfall) && grounded
	{
		image_index = 0 
		sprite_index = spr_idle
		state = states.normal
	}
	if (sprite_index == spr_machjump || sprite_index == spr_machjumpfall || sprite_index == spr_walljump || sprite_index == spr_walljumpfall) && grounded
	{
		image_index = 2
		sprite_index = spr_mach
	}
	if key_jump2 && grounded && sprite_index != spr_machturn
	{
		image_index = 0
		sprite_index = spr_machjump
		vsp = -9
	}
	if xscale == 1 && key_left2 && grounded
	{
		image_index = 0
		image_speed = 0.25
		sprite_index = spr_machturn
		state = states.slide
	}
	if xscale == -1 && key_right2 && grounded
	{
		image_index = 0
		image_speed = 0.25
		sprite_index = spr_machturn
		state = states.slide
	}
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_machturn)
	{
		sprite_index = spr_mach
		if xscale == 1
			xscale = -1
		else
			xscale = 1
		movespeed = 8
	}
	if !grounded && sprite_index != spr_machjump
	{
		sprite_index = spr_machjumpfall
	}
	if ((floor(image_index) == (image_number - 1) && sprite_index == spr_walljump))
	{
		sprite_index = spr_walljumpfall
	}
	if place_meeting_collision(x + (1 * xscale), y, obj_slope)
	{
		state = states.normal
		sprite_index = spr_idle
	}
	if key_attack2 && grounded {
		set_spr(choose(spr_nickel1, spr_nickel2))
		hsp = 0
		audio_play_sound(sfx_sack, 1, true)
		state = states.nickel;
	}
}
function scr_maurice_mach3()
{
	image_speed = 0.35
	hsp = xscale * movespeed
	if movespeed < 20 && (key_right || key_left) 
	{
		movespeed += 0.015
	}
	if key_jump2 && grounded
	{
		image_index = 0
		sprite_index = spr_mach3jump
		vsp = -9
	}
	if place_meeting(x + (1 * xscale), y, obj_solid) && (!grounded || groundedSlope)
	{
		wallspeed = movespeed
		state = states.runwall
	}
	if key_down
	{
		state = states.slide
	}
	if sprite_index == spr_walljump && image_index = 0
	{
		vsp = -9
	}
	if ((floor(image_index) == (image_number - 1) && sprite_index == spr_walljump))
	{
		sprite_index = spr_walljumpfall
	}
	if ((floor(image_index) == (image_number - 1) && sprite_index == spr_mach3jump))
	{
		sprite_index = spr_mach3
	}
	if xscale == 1 && key_left2 && grounded
	{
		image_index = 0
		image_speed = 0.25
		sprite_index = spr_mach3turn
		state = states.slide
		scr_soundeffect(sfx_machslide)
	}
	if xscale == -1 && key_right2 && grounded
	{
		image_index = 0
		image_speed = 0.25
		sprite_index = spr_mach3turn
		state = state = states.slide
		scr_soundeffect(sfx_machslide)
	}
	if !key_run && (sprite_index != spr_machjump || sprite_index != spr_machjumpfall) && grounded
	{
		image_index = 0 
		sprite_index = spr_idle
		state = states.normal
		y = y-8
	}
	if place_meeting_collision(x + (1 * xscale), y, par_collision) && !groundedSlope && grounded
	{
		state = states.mach
		y = y-8
		sprite_index = spr_idle
	}

	scr_taunt();
}
function scr_maurice_machslide()
{
	hsp = xscale * movespeed
	if sprite_index == spr_machturn || sprite_index == spr_mach3turn
	{
		if movespeed > 0 && movespeed > 0
		movespeed -= 0.45
	}
	if sprite_index == spr_machslide
	{
		if movespeed > 0 && movespeed > 0
		movespeed -= 0.35
	}
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_machturn) && grounded
	{
		sprite_index = spr_mach
		state = states.mach
		xscale *= -1
		movespeed = 8
		machshit = 0
	}
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach3turn) && grounded
	{
		sprite_index = spr_mach3
		state = states.mach3
		if xscale == 1
			xscale = -1
		else
			xscale = 1
		movespeed = 12
	}
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_machslide)
	{
		movespeed = 0
		sprite_index = spr_idle
		state = states.normal
	}
	scr_taunt();

}