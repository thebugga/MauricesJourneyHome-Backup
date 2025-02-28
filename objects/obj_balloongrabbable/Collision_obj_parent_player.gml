if active
{
	if (other.global.playerCharacter == Characters.Pierre && other.brick)
	{
		other.state = states.ratmountballoon
		active = 0
		cooldown = 100
		other.balloonbuffer = 250
	}
	else if (global.playerCharacter != Characters.Pierre)
	{
		other.state = states.balloon
		other.Movespeed = other.hsp
		active = 0
		with (other)
		{
			if global.playerCharacter == Characters.Pierre
				vsp = -7
		}
		cooldown = 100
		other.balloonbuffer = 250
	}
}
