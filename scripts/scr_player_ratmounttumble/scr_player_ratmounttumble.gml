function scr_player_ratmounttumble()
{
	hsp = movespeed
	move = (key_left + key_right)
	sprite_index = spr_lonegustavo_dashjump
	image_speed = (abs(movespeed) / 15)
	if (!key_attack)
		movespeed = approach(movespeed, 0, 1)
	if abs(hsp) <= 4 || (place_meeting((x + hsp), y, obj_solid) && !place_meeting_slope((x + hsp), y) && !place_meeting((x + hsp), y, obj_destructibles))
		state = states.ratmountcrouch
	if ((grounded && !key_down) || brick) && !place_meeting_solid(x, (y - 16)) && !place_meeting_solid(x, (y - 32))
		state = states.ratmount
	if (input_buffer_jump > 0 && grounded)
	{
		input_buffer_jump = 0
		particle_set_scale(particle.highjumpcloud2, Xscale, 1)
		create_particle(x, y, particle.highjumpcloud2, 0)
		//scr_soundeffect(sfx_jump)
		vsp = -11
		jumpstop = 0
	}
	if ((!jumpstop) && vsp < 0.5 && (!key_jump2))
	{
		vsp /= 10
		jumpstop = 1
	}
}
