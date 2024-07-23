if playerid != -4 && startedx == -4
{
	startedx = playerid.x
	startedy = playerid.y
}
if showboard
	x = Approach(x, 0, 20)
else
	x = Approach(x, -960, 20)
if (alarm[2] > 0)
{
	with (playerid)
	{
		sprite_index = spr_machfreefall
		x = lerp(roomstartx, other.startedx, other.alarm[2] / 200)
		y = lerp(roomstarty - 25, other.startedy, other.alarm[2] / 200)
	}
}
