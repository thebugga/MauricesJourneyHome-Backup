with obj_player
{
	state = states.actor
	reset_anim(spr_exitdoor)
	hat_spr = quick_ini_read_real($"saves/saveData{global.savefile}.ini", "Clothes", "hat", -4)
}