instance_destroy()
with (playerid)
{
	if (global.playerCharacter != Characters.Pierre)
		state = states.normal
	else
		state = states.ratmount
	visible = true
	x = roomstartx
	y = roomstarty - 25
	landAnim = false
}
with (obj_ghostfollow)
{
	x = xstart
	y = ystart
}
