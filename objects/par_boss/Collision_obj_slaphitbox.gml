state = states.chainsaw
if other.sweepoff
{
	movespeed = other.sweepH
	hitvsp = other.sweepV
	sprite_index = spr_flung
}
else
{
	hithsp = -5 * image_xscale
	hitvsp = 0
	sprite_index = spr_hit
}
hitLag = 5
hitX = x
hitY = y
hitstate = states.stun
hp -= other.damage
instance_destroy(other)
with (obj_bossplayer)
{
	hitLag = 5
	hithsp = hsp
	hitvsp = vsp
	hitX = x
	hitY = y
	hitstate = state
	state = states.chainsaw
}
