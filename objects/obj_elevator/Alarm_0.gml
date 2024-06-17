audio_stop_sound(sfx_mach3_1)
        lastroom_x = other.x
        lastroom_y = other.y
        lastroom = room
        obj_player.sprite_index = spr_maurice_lookdoor
        obj_player.target_door = "A"
        obj_player.target_room = hub_tutorial1
        obj_player.image_index = 0
        obj_player.state = states.normal
        other.visited = 1
        instance_create(x, y, obj_fadeout)