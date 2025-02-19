if instance_exists(obj_player1)
    player_index = obj_player1.player_index
if (!deactivated)
{
    swap_ready = 0
    if (mode == 0)
    {
        if (room == characterselect && global.swapmode)
        {
            mode = 1
            player_input_device[0] = -2
            player_input_device[1] = -2
        }
        else
        {
            for (var i = 0; i < gamepad_get_device_count(); i++)
            {
                var _index = scr_anybutton_pressed(i)
                if (_index > -2)
                {
                    device_selected[0] = 1
                    if (player_input_device[0] != _index)
                    {
                        for (var j = 0; j < gamepad_get_device_count(); j++)
                        {
                            if gamepad_is_connected(j)
                                gamepad_set_vibration(j, 0, 0)
                        }
                    }
                    player_input_device[0] = _index
                    press_start = 0
                }
            }
        }
    }
    else if (mode == 1)
    {
        if (!global.swapmode)
        {
            mode = 0
            player_input_device[1] = -1
        }
        swap_ready = 0
        var _found = 0
        for (var player = 0; player < obj_hardmode; player++)
        {
            if (player_input_device[player] == -2)
                _found = 1
        }
        if (!_found)
            swap_ready = 1
        for (player = 0; player < obj_hardmode; player++)
        {
            i = 0
            while (i < 8)
            {
                _index = scr_button_pressed(i)
                if (player_input_device[player] == -2 && _index >= -1)
                {
                    player_input_device[player] = _index
                    trace("Player ", player, " connected at index: ", _index)
                    player = obj_hardmode
                    break
                }
                else
                {
                    i++
                    continue
                }
            }
        }
    }
    if (switch_input_buffer <= 0)
    {
        i = 0
        while (i < 2)
        {
            if (player_input_device[i] <= -1)
            {
                i++
                continue
            }
            else if (player_input_device[i] >= 0)
            {
                if (!gamepad_is_connected(player_input_device[i]))
                {
                    deactivated = 1
                    device_selected[i] = 0
                    player_input_device[i] = -2
                    device_to_reconnect = i
                    scr_pause_deactivate_objects(0)
                    break
                }
                else
                {
                    i++
                    continue
                }
            }
            else
            {
                i++
                continue
            }
        }
    }
}
else
{
    i = 0
    while (i < 8)
    {
        _index = scr_button_pressed(i)
        if (player_input_device[device_to_reconnect] == -2 && _index >= -1)
        {
            player_input_device[device_to_reconnect] = _index
            deactivated = 0
            trace("Player ", device_to_reconnect, " connected at index: ", _index)
            scr_pause_activate_objects(0)
            alarm[0] = 1
            break
        }
        else
        {
            i++
            continue
        }
    }
}
