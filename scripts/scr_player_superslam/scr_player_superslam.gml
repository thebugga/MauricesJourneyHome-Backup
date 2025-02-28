function scr_player_superslam()
{
	if (sprite_index == spr_piledriver)
	{
		Move = (key_left + key_right)
		hsp = (Move * Movespeed)
		if (Move != dir && Move != 0)
		{
			dir = Move
			Movespeed = 0
		}
	}
	else
	{
		Move = 0
		hsp = 0
	}
	if (sprite_index == spr_piledriver && vsp >= 0)
		vsp += 0.5
	if (grounded && (!(place_meeting(x, (y + 1), obj_destructibles))) && sprite_index == spr_piledriver && vsp > 0)
	{
		//scr_soundeffect(sfx_groundpound)
		sprite_index = spr_piledriverland
		jumpAnim = 1
		image_index = 0
		with (obj_camera)
		{
			shake_mag = 20
			shake_mag_acc = (40 / room_speed)
		}
		hsp = 0
		bounce = 0
		with (instance_create(x, (y + 35), obj_bangeffect))
			Xscale = obj_parent_player.Xscale
		create_particle(x, y, particle.landcloud, 0)
		freefallstart = 0
	}
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	machslideAnim = 1
	MoveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 1
	if (sprite_index == spr_piledriverland && floor(image_index) == (image_number - 1))
	{
		vsp = -6
		state = states.jump
	}
	if (Move != 0)
	{
		if (Movespeed < 6)
			Movespeed += 0.5
		else if (floor(Movespeed) == 6)
			Movespeed = 6
	}
	else
		Movespeed = 0
	if (Movespeed > 6)
		Movespeed -= 0.1
	if (global.playerCharacter == Characters.Doise && Move != 0)
		Xscale = Move
	if (vsp < 0)
		image_speed = 0.35
	else
		image_speed = 0.5
	exit;
}

