//scr_soundeffect(asset_get_index(concat("sfx_scream", irandom_range(1, 10))))
with (instance_create(x, y, obj_sausageman_dead))
	sprite_index = other.deathspr
//scr_soundeffect(sfx_killenemy)
repeat (3)
{
	with (create_debris(x, y, spr_slapstar))
	{
		hsp = random_range(-5, 5)
		vsp = random_range(-10, 10)
	}
}
instance_create(x, y, obj_bangeffect)
quick_ini_write_real(get_savefile_ini(), "NPC", deathsavename, 1)