if obj_parent_player.key_jump2 && logos != 3
	logosbuffer = 0
if logosbuffer > 0
	logosbuffer--
else
{
	logos++
	logosbuffer = logos == 2 ? 300 : 150
	if logos > 2
		alarm[0] = 1
}

if logos == 2
{
	voyage_buffer--
	if voyage_buffer <= 0
	{
		var bufferray = [20, 60, 300]
		voyage_buffer = bufferray[voyage_state]
		voyage_state++
		if voyage_state == 3
			alarm[1] = 1
	}
	if voyage_state > 0
		tower_x = Approach(tower_x, 220, 4)
	if voyage_state > 1
		text_x = lerp(text_x, 310, 0.05)
}
