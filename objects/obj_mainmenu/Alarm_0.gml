switch state
{
	case states.backbreaker:
		state = states.actor
		break
	case states.transitioncutscene:
		state = states.normal
		flicker = 1
        with (obj_music)
			fmod_studio_event_instance_set_parameter_by_name_multiplatform(music.event, "state", 1, 1)
		break
	case states.transition:
		with (obj_parent_player)
		{
			targetRoom = hub_outside
			targetDoor = "A"
            state = states.titlescreen
		}
		with instance_create(0, 0, obj_fadeout)
			gamestart = true
		global.currentsavefile = saveselect
		gamesave_async_load()
		break
}