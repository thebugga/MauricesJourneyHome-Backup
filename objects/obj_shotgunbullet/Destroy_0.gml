if pistol && !brick
{
	with (instance_create(x, y, obj_deatheffect))
	{
		sprite_index = spr_peppinobullet_dead
		image_xscale = other.image_xscale
	}
}
if (sprite_index == spr_mortdead)
{
	with (instance_create(x, y, obj_deatheffect))
	{
		sprite_index = spr_mortdead
		image_xscale = other.image_xscale
	}
}
if (sprite_index != spr_bulletdisappear)
{
	repeat (6)
		create_particle((x + random_range(-25, 25)), (y + random_range(-25, 25)), particle.shotgunimpact, 0)
}
else
{
	repeat (6)
		create_particle(((x - (32 * image_xscale)) + random_range(-25, 25)), (y + random_range(-25, 25)), particle.shotgunimpact, 0)
}
