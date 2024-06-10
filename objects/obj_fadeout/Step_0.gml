if (fadealpha > 1)
{
    fadein = 1
    if instance_exists(obj_player)
    {
        with (obj_player)
        {
        }
        if (room != obj_player.target_room)
            room_goto(obj_player.target_room)
    }
}
if (fadein == 0)
    fadealpha += 0.1
else if (fadein == 1)
    fadealpha -= 0.1
if (fadein == 1 && fadealpha < 0)
    instance_destroy()


    with (obj_player)
    {
        if (other.fadein == 1 && (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_startgate)))
        {
            state = states.normal
            image_index = 0
			
        }
        if (other.fadein == 1 && obj_player.state == state = states.door)
            state = states.normal
    }
