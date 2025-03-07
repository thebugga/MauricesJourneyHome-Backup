function scr_sound_multiple(argument0, argument1, argument2)
{
    if (ds_map_find_value(global.FMOD_OneShotList, argument0) == undefined)
        ds_map_set(global.FMOD_OneShotList, argument0, ds_list_create())
    var _list = ds_map_find_value(global.FMOD_OneShotList, argument0)
    for (var i = 0; i < ds_list_size(_list); i++)
    {
        var b = ds_list_find_value(_list, i)
        fmod_studio_event_instance_stop(b, false)
        fmod_studio_event_instance_release(b)
    }
    ds_list_clear(_list)
    b = fmod_createEventInstance(argument0)
    fmod_studio_event_instance_start(b)
    fmod_event_set3DPosition(b, argument1, argument2)
    ds_list_add(_list, b)
}

