with (other.id)
{
    if ( y == (other.y + 50) && (!instance_exists(obj_fadeout)))
    {
        lastroom_x = other.x
        lastroom_y = other.y
        lastroom = room
        obj_player.hallway = 1
        obj_player.hallwaydirection = other.image_xscale
        obj_player.target_door = other.targetDoor
        obj_player.target_room = other.targetRoom
        obj_player.image_index = 0
        instance_create(x, y, obj_fadeout)
    }
}