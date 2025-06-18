if player_index == -1
{
	with obj_player
	{
		with instance_create(352, 320, obj_bossplayer)
		{
			play_id = other.id
			player_index = other.player
			character = other.character
			scr_bosscharacterspr();
		}
	}
	with instance_create(0, 0, obj_bosscontroller)
	{
		bossID = other.id
	}
}