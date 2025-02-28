switch state
{
	case states.arenaround:
		grav = 0.5
		state_boss_arenaround()
		movespeed = 0
		invincible = 1
		break
	case states.bump:
		grav = 0.5
		state_boss_bump()
		break
	case states.chainsaw:
		grav = 0.5
		state_boss_chainsaw()
		break
	case states.backbreaker:
		grav = 0.5
		state_boss_taunt()
		invincible = 1
		break
	case states.parry:
		grav = 0.5
		state_boss_parry()
		invincible = 1
		break
	case states.hit:
		grav = 0.5
		scr_enemy_hit()
		break
	case states.stun:
		grav = 0.5
		state_boss_stun()
		break
}