with (other)
{
	if shotgunAnim
	{
		shotgunAnim = 0
		with (instance_create(x, y, obj_deatheffect))
			sprite_index = spr_shotgunback
	}
}
