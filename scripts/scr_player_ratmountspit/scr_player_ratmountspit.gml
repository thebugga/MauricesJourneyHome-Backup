function scr_player_ratmountspit()
{
	image_speed = 0.6
	with (ratgrabbedID)
		scr_enemy_ratgrabbed()
	if (animation_end())
	{
		state = states.ratmount
		ratgrabbedID = -4
	}
	exit;
}

