with (obj_player)
{
    if (keyboard_key_press(vk_up) && grounded)
    {
        audio_stop_all()
        backtohubstartx = x
        backtohubstarty = y
        backtohubroom = room
        mach2 = 0
        obj_camera.chargecamera = 0
        image_index = 0
    }
}