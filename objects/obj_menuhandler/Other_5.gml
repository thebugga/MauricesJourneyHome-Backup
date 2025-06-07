with obj_player
{
	state = states.actor
	reset_anim(spr_exitdoor)
	pal_select = quick_ini_read_real($"saves/saveData{global.savefile}.ini", "Clothes0", "palette_index", 1)
	pattern_spr = quick_ini_read_real($"saves/saveData{global.savefile}.ini", "Clothes0", "pattern_sprite", pat_pizza)
	hat_spr = quick_ini_read_real($"saves/saveData{global.savefile}.ini", "Clothes0", "hat", -4)
}