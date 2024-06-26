if (showtext == 1)
{
    xi = (500 + random_range(1, -1))
    if (yi > 500)
        yi -= 5
}
if (showtext == 0)
{
    xi = (500 + random_range(1, -1))
    if (yi < 600)
        yi += 1
}

if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
{
    if (prompt != -4)
        prompt_buffer = 2
    bubbleindex += image_speed
    if (floor(bubbleindex) == sprite_get_number(bubblespr))
    {
        bubbleindex = 0
        switch bubblespr
        {
            case spr_tv_bubbleopen:
                bubblespr = spr_tv_bubble
                break
            case spr_tv_bubbleclose:
                bubblespr = spr_tv_bubbleclosed
                if (prompt == -4 || prompt == "")
                    bubblespr = spr_none
                break
        }

    }
}
if ((global.combotime > 0) && (global.combo > 0))
    visualcombo = global.combo
if (global.seconds < 0)
{
    global.seconds = 59
    global.minutes -= 1
}
if (global.seconds > 59)
{
    global.minutes += 1
    global.seconds -= 59
}
if (global.seconds <= 0 && global.minutes <= 0)
{
    alarm[1] = -1
}


if (room == titscreen2 || (string_copy(room_get_name(room), 1, 3) == "hub" && (!global.panic)))
    visible = false
else
    visible = true