if (instance_exists(obj_player))
{
	if obj_player.character == p_characters.maurice
		fmod_set_parameter("character", 0, true);
	else if obj_player.character == p_characters.undoised
		fmod_set_parameter("character", 1, true);
	else if obj_player.character == p_characters.mandrek
		fmod_set_parameter("character", 2, true);
}
fmod_set_parameter("swapmode", global.swapmode ? 1 : 0, true);