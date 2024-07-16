switch state
{
	case states.backbreaker:
		state = states.actor
		break
	case states.transitioncutscene:
		state = states.normal
		flicker = 1
		break
	case states.transition:
		global.currentsavefile = saveselect
		with (obj_player)
		{
			targetRoom = characterselect
			targetDoor = "A"
		}
		instance_create(0, 0, obj_fadeout)
		break
}