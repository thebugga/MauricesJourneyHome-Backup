if (buffer <= 0 && other.state != states.ghost && other.grounded)
{
	buffer = 50
	with (other)
	{
		vsp = -11
		Movespeed = abs(Movespeed)
		dir = Xscale
		Movespeed = 13
		instance_create(x, y, obj_jumpdust)
		sprite_index = spr_player_corpsestart
		image_index = 0
		state = states.trashroll
	}
}
