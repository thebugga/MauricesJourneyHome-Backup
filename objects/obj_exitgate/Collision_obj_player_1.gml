with (obj_player)
{
    if ((state == states.normal) && key_up)
    {
        target_room = other.target_room
        other.visited = 1
        image_index = 0
        instance_create(x, y, obj_fadeout)
    }
}
