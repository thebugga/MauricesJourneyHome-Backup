if obj_player1.visible && highscore > 0
{
	if (msg != "" && distance_to_object(obj_parent_player) < 50)
		msgy = Approach(msgy, 480, 5)
		else
		msgy = Approach(msgy, 550, 5)
	if distance_to_object(obj_parent_player) < 50 && !drawing
	{
		drawing = true
		alarm[1] = 1
	}
}