if (!instance_exists(ID))
{
	instance_destroy()
	exit;
}
x = ID.x
y = ID.y
image_xscale = ID.image_xscale
image_yscale = ID.image_yscale
with (ID)
{
	if (object_index == obj_coolpineapple || object_index == obj_forknight)
	{
		if (state != states.walk && state != states.rage)
		{
			hitboxcreate = 0
			instance_destroy(other)
		}
	}
	switch object_index
	{
		case obj_peppinoclone:
			other.x = (x - (image_xscale * 10))
			if (state != states.punch)
				instance_destroy(other)
			break
		
		case obj_motodude:
			other.x = (x + (image_xscale * 32))
			break
		
		case obj_robot:
			if (state != states.mach2 && state != states.slap && state != states.tackle)
			{
				hitboxcreate = 0
				instance_destroy(other)
			}
			else if (state == states.slap)
				other.x = (x + (image_xscale * 32))
			else if (state == states.mach2 || state == states.tackle)
				other.x = (x + (image_xscale * 20))
			break
		
		case obj_minijohn:
			if (state != states.rage && state != states.punch)
				instance_destroy(other)
			break
			
		case obj_boulder:
			if (!hitwall)
				instance_destroy(other)
			break
		
		case obj_snickexe:
			if (obj_player1.instakillmove || obj_player1.state == states.handstandjump)
			{
				instance_destroy(other)
				hitboxcreate = 0
			}
			break

		case obj_ancho:
			if (state != states.charge && state != states.rage)
			{
				hitboxcreate = 0
				instance_destroy(other)
			}
			break
	}

}
