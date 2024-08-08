with (other)
{
	if (state != states.trashroll && state != states.trashjump && state != states.cheeseball && grounded && movespeed != 0)
	{
		other.drop = 1
		state = states.slipnslide
		sprite_index = spr_slipnslide
		instance_destroy(other)
	}
}
