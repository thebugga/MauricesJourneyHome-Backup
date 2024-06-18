if instance_exists(obj_player)
{
	
    if (obj_player.character == "M")
        fmod_studio_system_set_parameter_by_name("isnoise", 0)
    if (obj_player.character == "D")
        fmod_studio_system_set_parameter_by_name("isnoise", 1)
}
