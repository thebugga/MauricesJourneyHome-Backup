if instance_exists(playerid)
{
	if (playerid.state != states.lungeattack && playerid.state != states.handstandjump)
	{
		instance_destroy()
		exit;
	}
	x = (playerid.x + (24 * playerid.Xscale))
	y = playerid.y
}