if obj_player.visible && highscore > 0
{
	if (msg != "" && distance_to_object(obj_player) < 50)
		msgy = Approach(msgy, 480, 5)
		else
		msgy = Approach(msgy, 550, 5)
	if place_meeting(x, y, obj_player)
	{
		image_speed = 0.35
		drawing = true
	}
	else
	{
		image_speed = 0
		image_index = 0
	}
}
