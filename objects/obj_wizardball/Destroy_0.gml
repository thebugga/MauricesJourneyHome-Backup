with playerid
{
	if sprite_index == spr_wizardattack
	{
		state = states.wizard
		reset_anim(spr_wizardbump)
		movespeed = 0
	}
}