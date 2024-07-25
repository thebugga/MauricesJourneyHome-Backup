var fmod_character = ds_map_create()
ds_map_set(fmod_character, "M", 0)
ds_map_set(fmod_character, "D", 1)
ds_map_set(fmod_character, "P", 2)

if instance_exists(obj_player1)
    fmod_set_parameter("character", ds_map_find_value(fmod_character, obj_player1.character), true)
