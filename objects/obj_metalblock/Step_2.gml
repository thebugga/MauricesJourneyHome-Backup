if (ds_list_find_index(global.ds_saveroom, id) != -1)
{
	instance_destroy()
	exit
}

with obj_player
{
	var kill = false
	if ((state == states.mach3 || (character == p_characters.mandrek && abs(hsp) >= 4.625)) && place_meeting(x + hsp + xscale, y, other))
		kill = true
	else if (state == states.groundpound && freefallsmash >= 10 && place_meeting(x, y + 1, other))
	{
		kill = true
		grounded = true
		vsp = 0
	}
	else if (state == states.piledriver && vsp >= 10 && place_meeting(x, y + 1 + vsp, other))
	{
		kill = true
		grounded = true
		vsp = 0
	}
		
	if kill
		instance_destroy(other)
}
