if (floor(obj_player.image_index) == (obj_player.image_number - 1) && obj_player.state == states.door)
{
    with (obj_player)
    {

        obj_music.fadeoff = 0
        target_door = other.target_door
        target_room = other.target_room
        if (!instance_exists(obj_fadeout))
            instance_create(x, y, obj_fadeout)
    }
}
with (obj_player)
{
    if (key_up2 && grounded && (state == states.normal))
    {
        sprite_index = spr_maurice_gate
        global.backtohubstartx = x
        global.backtohubstarty = y
        global.backtohubroom = room
        mach2 = 0
        image_index = 0
        obj_player.state = states.door
    }
}