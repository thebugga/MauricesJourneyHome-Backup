switch sprite_index
{
	case spr_player_secondjump:
	sprite_index = spr_player_secondjumploop
	break
	case spr_player_finishingblow_1:
	sprite_index = spr_player_jump
	grav = 0.25
	with obj_player
		state = states.normal
	break
	case spr_player_jump:
	sprite_index = spr_player_fall
	break
}

image_index = 0