function scr_maurice_climbwall()
{
	move = (key_left + key_right)
	suplexmove = 0
	vsp = (-wallspeed)
	if (wallspeed < 24 && move == xscale)
	    wallspeed += 0.05
	crouchslideAnim = 1
	sprite_index = spr_maurice_runwall
	if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
	{
	    image_index = 0
	    state = states.normal
	}
	if (!(scr_solid((x + xscale), y)))
	{
	    vsp = 0
	    if (movespeed >= 8)
	        state = states.mach2
	    if (movespeed >= 12)
	    {
	        state = states.mach3
	        sprite_index = spr_mach2
	    }
	}
}
