function scr_enemy_idle()
{
	hsp = 0
	if (vsp > 1 && (grounded or (grounded && (!(place_meeting(x, y, obj_platform))))))
	{
		create_particle(x, y, particle.landcloud, 0)
		image_index = 0
	}
	if ((vsp >= 0 or object_index == obj_miniufo or object_index == obj_kentukybomber) && sprite_index == scaredspr && scaredbuffer <= 0)
	{
		state = states.walk
		sprite_index = walkspr
	}
	if (scaredbuffer > 0)
		scaredbuffer--
	if (sprite_index == spr_forknight_turn && floor(image_index) == (image_number - 1))
	{
		sprite_index = walkspr
		state = states.walk
	}

	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		hsp += (_railinst.movespeed * _railinst.dir)
	}
	image_speed = 0.35
	exit;
}

