var fmod_character = ds_map_create()
ds_map_set(fmod_character, Characters.Maurice, 0)
ds_map_set(fmod_character, Characters.Doise, 1)
ds_map_set(fmod_character, Characters.Mrorange, 2)

if instance_exists(obj_player1)
    fmod_studio_system_set_parameter_by_name("character", ds_map_find_value(fmod_character, global.playerCharacter), true)
