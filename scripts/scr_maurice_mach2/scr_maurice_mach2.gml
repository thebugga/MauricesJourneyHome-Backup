//whuh?_call
function scr_maurice_mach2(){
	image_speed = 0.35
	hsp = (xscale * movespeed)
	if (movespeed < 12)
		movespeed += 0.1
	else
	{
		set_spr(spr_maurice_mach3);
		state = states.mach3;
	}
	if (grounded && (place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))){
		movespeed = 0
		state = states.normal;
	}
	if key_jump2 && grounded
		vsp = -10
	if !key_run
		state = states.normal;
	scr_taunt();
}
