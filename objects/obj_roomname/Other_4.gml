global.roomname = scr_roomnames(room)
if (global.roomname == "NaN")
    global.roomname = ""
visible = false
msg = scr_roomnames(room)
if (msg != "NaN")
{
	visible = true
	showtext = true
	alarm[0] = 200
}