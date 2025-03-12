//playerid.x = x WHY
//playerid.y = y IN WHAT WorLD IS THIS A GOOD GAME DESIGN DECISION
repeat (3)
{
	with (create_debris(x, y, spr_slapstar))
	{
		hsp = random_range(-5, 5)
		vsp = random_range(-10, 10)
	}
}
instance_create(x, y, obj_bangeffect)
