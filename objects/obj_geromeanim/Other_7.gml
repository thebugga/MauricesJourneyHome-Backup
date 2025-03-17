switch sprite_index
{
	case spr_player_secondjump1:
	sprite_index = spr_player_secondjump2
	break
	case spr_player_finishingblow1:
	sprite_index = spr_player_jump2
	grav = 0.25
	with obj_parent_player
		state = states.normal
	break
	case spr_player_jump2:
	sprite_index = spr_player_fall2
	break
}

image_index = 0