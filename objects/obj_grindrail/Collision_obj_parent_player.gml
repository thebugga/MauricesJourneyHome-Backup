if (place_meeting(x, y, other) && other.state != states.tumble && other.state != states.backbreaker && other.state != states.bump && other.y > other.yprevious && other.y < y)
{
	if (!global.playerCharacter == Characters.Pierre)
	{
		other.y = (y - 49)
		other.state = states.grind
	}
	else if (other.state != states.ratmountgrind)
	{
		with (other)
		{
			if (brick == 1)
			{
				with (instance_create(x, y, obj_brickcomeback))
				{
					playerid = other.id
					ispeetzy = other.riderispeetzy
					wait = 1
				}
			}
			brick = 0
		}
		other.y = (y + 8)
		other.state = states.ratmountgrind
	}
}
