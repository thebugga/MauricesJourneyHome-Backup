if string_copy(room_get_name(room), 1, 3) == "hub" && !global.panic
	visible = true
else
{
	visible = false
	y = 0
	timer = 0
}
with obj_player1
{
	if hsp == 0 && state == states.normal
	{
		if other.timer < 100
			other.timer++
	}
	else
		other.timer = 0
}
up = (timer == 100)

y = approach(y, (up ? sprite_height : 0), 15)