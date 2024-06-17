with (other.id)
{
    if (key_up) && (!instance_exists(obj_fadeout))
    {
		stop_music()
        lastroom_x = other.x
        lastroom_y = other.y
        lastroom = room
        obj_player.sprite_index = spr_maurice_lookdoor
        obj_player.target_door = other.targetDoor
        obj_player.target_room = other.targetRoom
        obj_player.image_index = 0
        obj_player.state = states.door
        other.visited = 1
        instance_create(x, y, obj_fadeout)
    }
}
