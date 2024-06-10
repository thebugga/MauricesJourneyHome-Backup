//whuh?_call
function scr_maurice_mach3(){
		image_speed = 0.35
	hsp = (xscale * movespeed)
	if (movespeed < 12){
				movespeed += 0.1
	} else {
		
	}
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
	if !key_run
		state = states.normal;
	scr_taunt();
}
