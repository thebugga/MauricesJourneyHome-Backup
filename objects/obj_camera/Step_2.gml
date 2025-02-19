if global.panic
{
    if (global.panicshadetimer < 250000)
    {
        if (global.panicshadetimer < 40000)
            global.panicshadetimer += 200
        else
            global.panicshadetimer += 50
    }
    else
        global.panicshadetimer += 1
}
if (global.panicshadetimer < 0)
    global.panicshadetimer = 0
if (global.wave < 0)
    global.wave = 1
if (global.maxwave < 0)
    global.maxwave = 1
if (global.fill < 0)
    global.fill = 0
idkanymore = cos(rotates)
if (global.panic == 1)
{
    rotates += 0.015
    camera_set_view_angle(view_camera[0], (idkanymore * 1.5))
}


