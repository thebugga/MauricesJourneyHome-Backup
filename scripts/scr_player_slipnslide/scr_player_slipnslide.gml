function scr_player_slipnslide()
{
	mach2 = 0
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 0
	machhitAnim = 0
	hsp = (Xscale * movespeed)
	alarm[5] = -1
	alarm[8] = 60
	alarm[7] = 120
	hurted = 1
	machhitAnim = 0
	crouchslideAnim = 1
	if (movespeed <= 0)
	{
		state = states.normal
		movespeed = 0
		mach2 = 0
		image_index = 0
	}
	if (place_meeting_solid((x + Xscale), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) or place_meeting_slope((x + sign(hsp)), y)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
	{
		vsp = -5
		sprite_index = spr_slipbanan1
		image_index = 0
		state = states.slipbanan
	}
	if (slopeCheck(x + Xscale, y) && movespeed <= 0)
		movespeed = 2
	image_speed = 0.35
	if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 1.5 && sprite_index == spr_slipnslide)
	{
		with (instance_create(x, y, obj_slidecloud))
			image_xscale = other.Xscale
	}
	if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 1.5 && place_meeting(x, (y + 1), obj_current))
	{
		with (instance_create(x, y, obj_slidecloud))
		{
			image_xscale = other.Xscale
			sprite_index = spr_watereffect
		}
	}
	if (sprite_index == spr_currentplayer && (!(place_meeting(x, (y + 1), obj_current))))
	{
		vsp = -5
		sprite_index = spr_slipbanan1
		image_index = 0
		state = states.slipbanan
	}
	if (sprite_index == spr_slipnslide)
	{
		if grounded
		{
			movespeed -= 0.1
			if (input_buffer_jump > 0 && grounded)
			{
				input_buffer_jump = 0;
				scr_fmod_soundeffect(jumpsnd, x, y)
				particle_set_scale(particle.highjumpcloud2, Xscale, 1);
				create_particle(x, y, particle.highjumpcloud2, 0);
				vsp = -10
				jumpstop = false;
			}
		}
		if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
		{
			vsp /= 2
			jumpstop = 1
		}
	}
	exit;
}

