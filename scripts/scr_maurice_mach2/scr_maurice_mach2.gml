function scr_maurice_mach()
{
	var maxmovespeed = 12;
	var jumpspeed = -11;
	var slopeaccel = 0.1;
	var slopedeccel = 0.2;
	var accel = 0.1;
	var mach4accel = 0.4;
	var machrollvsp = 10;
	hsp = (xscale * movespeed)
	move2 = key_right2 + key_left2;
	move = key_right + key_left;
	crouchslideAnim = true;
	if grounded && vsp > 0
	{
		if sprite_index != spr_mach && sprite_index != spr_mach1 && sprite_index != spr_mach3 
		{
				sprite_index = spr_mach;
		}
	}
	if (floor(image_index) == image_number - 1 && sprite_index == spr_mach)
		sprite_index = spr_mach1;
	if grounded
	{
		if movespeed < maxmovespeed
		{
			if mach4mode == false
				movespeed += accel;
			else
				movespeed += mach4accel;
		}
		if (abs(hsp) >= maxmovespeed)
		{
			machhitAnim = false;
			state = states.mach3;
			flash = true;
				sprite_index = spr_mach3;
		}
	}
	if ((!grounded && (place_meeting(x + hsp, y, obj_solid) || place_meeting_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles)) || (grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || place_meeting_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles)&& place_meeting(x, y + 1, obj_slope)))
	{
		var _climb = true;
		if _climb
		{
			wallspeed = movespeed;
			grabclimbbuffer = 0;
			if movespeed < 1
				wallspeed = 1;
			else
				movespeed = wallspeed;
			state = states.runwall;
		}
	}
	if (!grounded && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		var _climb = true;
		if _climb
		{
			wallspeed = movespeed;
			grabclimbbuffer = 0;
			state = states.runwall;
		}
	}
            if (((!key_run) && sprite_index != spr_idle && grounded))
            {
                sprite_index = spr_idle
                state = states.normal
                image_index = 0
            }
	if !instance_exists(dashcloudid) && grounded
	{
		with (instance_create(x, y, obj_dashcloud))
		{
			image_xscale = other.xscale;
			other.dashcloudid = id;
		}
	}
	if (grounded && floor(image_index) == image_number - 1)
		sprite_index = spr_mach;
	if (floor(image_index) == image_number - 1)
		sprite_index = spr_mach;
	if key_attack2 && grounded {
		set_spr(choose(spr_nickel1, spr_nickel2))
		hsp = 0
		scr_soundeffect(sfx_sack)
		state = states.nickel;
	}
	scr_taunt();
	
	if ((!key_run && movespeed >= 8))
	{
		image_index = 0;
		state = states.slide;
		sprite_index = spr_machslidestart;
	}
	else if !key_run && movespeed < 8 
		state = states.normal;
	if move == -xscale && movespeed >= 8 
	{
		image_index = 0;
		state = states.slide;
		sprite_index = spr_machslidestart;
	}
	
}

function scr_maurice_mach3()
{
    hsp = xscale * movespeed
    move = key_right + key_left
    var slopeaccel = 0.1
    var slopedeccel = 0.2
    var mach4movespeed = 20
    var mach3movespeed = 16
    var accel = 0.1
    var mach4accel = 0.1
    var jumpspeed = -11
    var machrollspeed = 10
    if (move == xscale && grounded)
    {
        if (movespeed < mach4movespeed)
        {
            if (mach4mode == false)
                movespeed += accel
            else
                movespeed += mach4accel
        }
    }
    if (sprite_index == spr_mach3&& (!key_attack))
    {
        state = states.normal
        image_index = 0
    }
    if grounded
        jumpstop = false
    if ((!key_jump2) && jumpstop == false && vsp < 0.5)
    {
        vsp /= 20
        jumpstop = true
    }
    if (move != xscale)
    {
        state = states.slide
        sprite_index = spr_mach3turn
        image_index = 0
        image_speed = 0.35
        movespeed = 12
        xscale *= 1
    }
    if ((!instance_exists(obj_dashcloud)) && grounded)
    {
        with (instance_create(x, (y - 5), obj_dashcloud))
        {
            image_xscale = other.xscale
        }
    }
    if place_meeting((x + xscale), y, obj_solid)
        state = states.normal
    image_speed = 0.35
}
function scr_maurice_machslide()
{
    hsp = xscale * movespeed
    if (sprite_index == spr_mach3turn && floor(image_index) == (image_number - 1))
    {
        movespeed = 12
        state = states.mach3
        sprite_index = spr_mach3
        image_index = 0
        xscale *= -1
    }

}