if (global.playerCharacter == Characters.Vigilante)
{
	with (all)
	{
		if place_meeting(x, y, other)
			instance_destroy()
	}
}
