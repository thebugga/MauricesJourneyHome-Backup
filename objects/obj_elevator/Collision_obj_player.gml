with (other.id)
{
    if (key_up2) && (!instance_exists(obj_fadeout))
    {
        event_path = fmod_studio_system_get_event("event:/music/levator");
        event = fmod_studio_event_description_create_instance(event_path);
        fmod_studio_event_instance_start(event);
        stop_music()
        obj_player.sprite_index = spr_maurice_lookdoor
        obj_player.target_room = -4
        obj_player.image_index = 0
        obj_player.state = states.door
        other.visited = 1
		other.fadein = 1
    }
}
