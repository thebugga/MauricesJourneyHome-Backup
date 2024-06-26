if trapdoor
{
if trapopen
{
if charvely == 0
{
charvely = 1
alarm[0] = 200
}
else
 {
        stop_music()
with (obj_player)
{
        lastroom_x = x
        lastroom_y = y
        lastroom = room
        target_door = other.targetDoor
        target_room = other.targetRoom
}
        fadein = true
        instance_create(x, y, obj_fadeout)
    }
}
else
{
trapopen = true
charsprite = spr_haha_3
elavatorsprite = spr_haha_2
collect_shake = 0
alarm[0] = 100
		panic_instance = fmod_studio_system_get_event("event:/music/levator");
        panic_instance_ref = fmod_studio_event_description_create_instance(panic_instance);
		fmod_studio_event_instance_stop(panic_instance_ref, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
		fmod_studio_event_instance_set_paused(panic_instance_ref, true)
event_path = fmod_studio_system_get_event("event:/sfx/bell");
event = fmod_studio_event_description_create_instance(event_path);
fmod_studio_event_instance_start(event)
}
}
else
    {
        stop_music()
with (obj_player)
{
        lastroom_x = x
        lastroom_y = y
        lastroom = room
        target_door = other.targetDoor
        target_room = other.targetRoom
}
        fadein = true
        instance_create(x, y, obj_fadeout)
    }