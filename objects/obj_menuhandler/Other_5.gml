with obj_player
{
	state = states.actor
	reset_anim(spr_exitdoor)
	if quick_ini_read_real($"saves/saveData{global.savefile}.ini", "Clothes", "hat", -4) != -4
	{
		with instance_create(x, y, obj_playerhat)
		{
			playerid = other.id
			sprite_index = quick_ini_read_real($"saves/saveData{global.savefile}.ini", "Clothes", "hat", -4)
		}
	}
}