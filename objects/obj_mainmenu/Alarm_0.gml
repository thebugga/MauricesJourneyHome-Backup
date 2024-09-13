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
		with (obj_player)
		{
			targetRoom = tower_entrancehall
			targetDoor = "D"
		}
		with instance_create(0, 0, obj_fadeout)
			gamestart = true
		global.currentsavefile = saveselect
		gamesave_async_load()
		break
}