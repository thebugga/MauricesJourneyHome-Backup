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

