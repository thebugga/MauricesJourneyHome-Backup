global.roomname = scr_roomnames(room)
if (global.roomname == "NaN")
    global.roomname = ""
if (!(in_ds_list(room, global.saveroom)))
{
    visible = false
    msg = scr_roomnames(room)
    if (msg != "NaN")
    {
        visible = true
        showtext = true
        alarm[0] = 200
        ds_list_add(global.saveroom, room)
    }
}
