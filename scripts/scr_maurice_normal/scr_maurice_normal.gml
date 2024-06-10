//whuh?_call
function scr_maurice_normal()
{
	image_speed = 0.4 
	audio_stop_sound(sfx_sack)
	hsp = xscale * movespeed
	if move != 0 {
		xscale = move
		movespeed = 6
		if !(taunted)
		set_spr(spr_move)
	} else {
		movespeed = 0
		if !(taunted)
		set_spr(spr_idle)
	}
	if key_jump2 && grounded
	{
		image_index = 0
		audio_play_sound(sfx_jump, 1, false)
		set_spr(spr_jump)
		vsp = -11
		state = states.jump;
	}
	if key_attack2 && grounded {
		set_spr(choose(spr_nickel1, spr_nickel2))
		hsp = 0
		audio_play_sound(sfx_sack, 1, true)
		state = states.nickel;
	}
	if key_run && grounded && !taunted {
		set_spr(spr_mach2)
		state = states.mach2;
	}
	scr_taunt();
}