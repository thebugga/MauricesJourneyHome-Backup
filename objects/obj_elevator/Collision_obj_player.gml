with (other.id)
{
    if (key_up2) && (!instance_exists(obj_fadeout))
    {
        stop_music()
		fmod_event_one_shot("event:/music/levator")
        obj_player.sprite_index = spr_player_lookdoor
        obj_player.target_room = -4
        obj_player.image_index = 0
        obj_player.state = states.door
        other.visited = 1
		other.fadein = 1
    }
}
