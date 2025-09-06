if enemy_can_die(other)
{
	other.state = states.stun
	other.hsp = image_xscale * 3
	other.vsp = -4
	other.alarm[0] = 1
}
instance_destroy()