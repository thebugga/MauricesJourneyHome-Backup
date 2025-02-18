if (!instance_exists(obj_player1))
{
    alarm[0] = 1
    instance_activate_object(obj_parent_player)
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
	with obj_parent_player
	{
	    x = backtohubstartx
	    y = backtohubstarty
	    state = states.actor
	    sprite_index = spr_rockethitwall
		visible = false
	}
    alarm[1] = 100
}
