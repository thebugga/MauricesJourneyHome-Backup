if !invincible && other.playerid != id && other.playerid.team == !team
{
	state = states.stun
	if other.sweepoff
	{
		movespeed = other.sweepH
		prev.vsp = other.sweepV
		reset_anim(spr_flung)
	}
	else
	{
		prev.hsp = -5 * image_xscale
		prev.vsp = 0
		reset_anim(spr_hurt)
	}
	prev.lag = 5
	prev.x = x
	prev.y = y
	prev.state = states.hit
	HP -= other.damage
	with (other.playerid)
	{
		prev = {
			lag: 5,
			state: self.state,
			x: self.x,
			y: self.y,
			hsp: self.hsp,
			vsp: self.vsp,
			sprite_index: self.sprite_index,
			image_index: self.image_index,
		}
		state = states.stun
	}
	instance_destroy(other)
}