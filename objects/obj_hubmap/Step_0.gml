if string_copy(room_get_name(room), 1, 3) == "hub" && !global.panic
	visible = true
else
{
	visible = false
	y = 0
	up = false
}
if obj_player1.key_up2
	up = !up

y = approach(y, (up ? sprite_height : 0), 15)