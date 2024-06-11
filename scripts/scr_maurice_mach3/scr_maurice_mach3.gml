//whuh?_call
function scr_maurice_mach3(){
		image_speed = 0.35
    xscale = move
	hsp = (xscale * movespeed)
	movespeed = 16
	sprite_index = spr_maurice_mach3
	if (((!grounded) && place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_slope)))) || (grounded && place_meeting((x + hsp), (y - 64), obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && place_meeting(x, (y + 1), obj_slope)))
	{
	    wallspeed = movespeed
	    state = states.runwall
	}
	if (grounded && (place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))){
		movespeed = 0
		state = states.normal;
	}
	if key_jump2 && grounded {
		vsp = -10
	}
	if !key_run{
	    sprite_index = spr_maurice_idle
		state = states.normal;
	}
	with (create_mach3effect(x, y, sprite_index, image_index, true))
	{
				image_xscale = other.xscale;
				identifier = afterimage.mach3effect
	}
	scr_taunt();
}
