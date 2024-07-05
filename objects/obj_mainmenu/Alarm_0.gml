switch state
{
	case states.backbreaker:
		state = states.actor
		break
	case states.transitioncutscene:
		state = states.normal
		break
	case states.transition:
		global.currentsavefile = saveselect
		with (obj_player)
		{
			targetRoom = hub_outside
			targetDoor = "A"
		}
		instance_create(0, 0, obj_fadeout)
		break
}