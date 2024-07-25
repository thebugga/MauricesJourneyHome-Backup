if (other.state != states.gotoplayer && visible)
{
    if (obj_player1.character == "V")
        global.playerhealth = clamp((global.playerhealth + 100), 0, 100)
    global.heattime = 60
    with (obj_camera)
        healthshaketime = 120
    scr_soundeffect(sfx_collectgiantpizza)
    if (other.object_index == obj_player1)
        global.collect += 1000
    else
        global.collectN += 1000
    if (global.bullet < 3)
        global.bullet += 1
    var _x = x - 48
    var _y = y - 48
    var _xstart = _x
    for (var yy = 0; yy < 4; yy++)
    {
        for (var xx = 0; xx < 4; xx++)
        {
            create_collect(_x, _y, (spotplayer.character == "M" ? choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect) : choose(spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5)))
            _x += 16
        }
        _x = _xstart
        _y += 16
    }
    with (instance_create((x + 16), y, obj_smallnumber))
        number = string(1000)
    visible = false
    if (string_pos("secret", room_get_name(room)) != 0)
    {
		with (obj_player)
		{
			targetRoom = lastroom
			targetDoor = "S"
			state = states.secretenter
		}
		alarm[0] = 150
    }
}
