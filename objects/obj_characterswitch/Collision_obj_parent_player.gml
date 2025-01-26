with (other)
{
	if (other.visible)
	{
		switch character
		{
			case "M":
				character = "D"
				break;
			case "D":
				character = "M"
				break;
		}
		other.respawn = 200
		other.visible = false
		scr_characterspr()
	}
}
