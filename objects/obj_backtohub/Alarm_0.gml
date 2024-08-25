if (!instance_exists(obj_player1))
{
    alarm[0] = 1
    instance_activate_object(obj_player1)
}
else
{
	if reset
    {
        global.levelreset = false
        scr_playerreset(false)
        with (obj_music)
            event_perform(ev_other, ev_room_start)
    }
    obj_player1.x = obj_player1.backtohubstartx
    obj_player1.y = obj_player1.backtohubstarty
    obj_player1.state = states.actor
    obj_player1.sprite_index = obj_player1.spr_rockethitwall
	obj_player1.visible = false
    alarm[1] = 100
}
