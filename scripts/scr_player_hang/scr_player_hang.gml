function scr_player_hang()
{
	hsp = 0
	if (sprite_index == spr_playerN_wallclingstart && animation_end())
		sprite_index = spr_playerN_wallcling
	vsp = 0
	wallclingcooldown = 0
	if (animation_end())
	{
		//scr_soundeffect(sfx_jump)
		//scr_soundeffect(sfx_woosh)
		jumpstop = 0
		vsp = -15
		state = states.jump
		sprite_index = spr_playerN_noisebombspinjump
		image_index = 0
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.Xscale
	}
	image_speed = 0.35
	exit;
}

