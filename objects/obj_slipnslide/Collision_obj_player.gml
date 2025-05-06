with (other)
{
	if (grounded && movespeed != 0)
	{
		state = states.slipnslide
		sprite_index = spr_slipnslide
		instance_destroy(other)
	}
}
