HP--
if HP <= 0
	instance_destroy()
else
{
	hsp = ouched.hsp
	vsp = ouched.vsp
	state = states.stun
	stun_timer = 180
	waiting = true
}