function add_music(argument0, argument1, argument2, argument3, argument4) //add_music
{
    if (argument4 == undefined)
        argument4 = -4
    var b = 
    {
        continuous: argument3,
        on_room_start: -4,
        value: 0,
        immediate: false,
        event: -4,
        event_secret: -4
    }

    with (b)
    {
        if (argument4 != -4)
            on_room_start = method(self, argument4)
        if (argument1 != -4)
        {
            event_name = argument1
            event = fmod_event_create_instance(argument1)
        }
        if (argument2 != -4)
        {
            event_secret_name = argument2
            event_secret = fmod_event_create_instance(argument2)
        }
    }
    ds_map_set(music_map, argument0, b)
    return b;
}

function stop_music() //stop_music
{
    with (obj_music)
    {
        if (music != noone)
        {
            if obj_pause.pause
            {
                fmod_event_instance_stop(music.event, true)
                fmod_event_instance_stop(music.event_secret, true)
            }
            else
            {
                fmod_event_instance_stop(music.event, false)
                fmod_event_instance_stop(music.event_secret, false)
            }
        }
        fmod_event_instance_stop(pillarmusicID, true)
        fmod_event_instance_stop(panicmusicID, true)
    }
}

function hub_state(_room, _sound, _secretsound)
{
	var s = 0;
	fmod_event_instance_set_parameter(_sound, "hub", s, false);
}
function music_get_pos_wrap(argument0, argument1) //music_get_pos_wrap
{
    while (argument0 > argument1)
        argument0 -= argument1
    if (argument0 < 1)
        argument0 = 1
    return argument0;
}

