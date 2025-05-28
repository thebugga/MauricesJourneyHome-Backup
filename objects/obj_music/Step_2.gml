var fmod_character = ds_map_create()
ds_map_set(fmod_character, p_characters.maurice, 0)
ds_map_set(fmod_character, p_characters.pierre, 0)
ds_map_set(fmod_character, p_characters.undoised, 1)
ds_map_set(fmod_character, p_characters.mandrek, 2)

if instance_exists(obj_player)
    fmod_studio_system_set_parameter_by_name("character", ds_map_find_value(fmod_character, obj_player.character), true)
