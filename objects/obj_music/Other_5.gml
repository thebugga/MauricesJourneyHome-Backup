if fmod_event_instance_is_playing(kidspartychaseID)
	scr_monster_deactivate();
fmod_set_parameter("totem", false, false);
fmod_set_parameter("pillarfade", false, true);
