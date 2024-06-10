if ((global.panic == 1)){
with (obj_player)
{
    if ((state == states.normal) && key_up2)
    {
        target_room = other.target_room
        other.visited = 1
        image_index = 0
        instance_create(x, y, obj_fadeout)
	state = states.door
	global.panic = false
    }
}
}
