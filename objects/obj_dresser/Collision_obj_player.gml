if other.key_up.pressed && other.state == states.normal
{
	up = true
	playerid = other.id
	walk_sprite = other.spr_idle
	obj_player.state = states.actor
	obj_player.hsp = 0
	switch other.pal_select
	{
		case 0:
		case 1:
				h_select[0] = 0  break;
		case 2: h_select[0] = 1 break;
		case 3: h_select[0] = 2 break;
		case 4: h_select[0] = 3 break;
		case 5: h_select[0] = 4 break;
		case 6: h_select[0] = 5 break;
		case 7: h_select[0] = 6 break;
		case 8: h_select[0] = 7 break;
		case 9: h_select[0] = 8 break;
		case 10: h_select[0] = 9 break;
		case 11: h_select[0] = 10 break;
		case 12: 
			switch other.pattern_spr
			{
				case pat_gomer: h_select[0] = 11 break;
			}
			break;
	}
	h_select[1] = 0
	switch other.hat_spr
	{
		case spr_hat_mets: other.h_select[1] = 1 break;
		case spr_hat_doom: other.h_select[1] = 2 break;
	}
}
