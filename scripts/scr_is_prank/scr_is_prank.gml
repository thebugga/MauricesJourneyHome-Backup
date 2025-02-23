function scr_is_prank()
{
	if (/*global.treasure && global.toppintotal >= 5 && global.secretfound >= 3 &&*/ global.collect > global.srank && global.lap && !global.combodropped)
		return true;
	else
		return false;
}

function scr_do_rank(argument0, argument1) //gml_Script_scr_do_rank
{
    if (argument0 == undefined)
        argument0 = true
    if (argument1 == undefined)
        argument1 = false
    var ex = x
    var ey = y
    var cx = camera_get_view_x(view_camera[0])
    var cy = camera_get_view_y(view_camera[0])
    rankpos_x = ex - cx
    rankpos_y = ey - cy
    if (global.tutorial_room)
    {
        var _lap = false
        ini_open_from_string(obj_savesystem.ini_str)
        ini_write_real("Tutorial", "finished", true)
        if ((global.level_minutes < 2 || global.level_minutes < 1 || (global.level_minutes == 1 && global.level_seconds <= 40)) && ini_read_real("Tutorial", "lapunlocked", false) == false)
        {
            ini_write_real("Tutorial", "lapunlocked", true)
            _lap = true
        }
        obj_savesystem.ini_str = ini_close()
        if _lap
            create_transformation_tip(lang_get_value("tutorial_lapunlock"))
    }
	else
    {
        if (!argument1)
            scr_savescore(global.leveltosave)
        else
        {
            ini_open_from_string(obj_savesystem.ini_str)
            var _hats = global.hats
            if (ini_read_real("Hats", global.leveltosave, 0) < _hats)
                ini_write_real("Hats", global.leveltosave, _hats)
            var _extrahats = global.extrahats
            if (ini_read_real("Extrahats", global.leveltosave, 0) < _extrahats)
                ini_write_real("Extrahats", global.leveltosave, _extrahats)
            var _rank = "d"
            var maxhats = 6 + global.srank
            var currhats = _extrahats + _hats
            if (currhats >= maxhats && (!global.bossplayerhurt))
                _rank = "p"
            else if (currhats >= (maxhats - 2))
                _rank = "s"
            else if (currhats >= (maxhats - 4))
                _rank = "a"
            else if (currhats >= (maxhats - 6))
                _rank = "b"
            else if (currhats >= (maxhats - 8))
                _rank = "c"
            global.rank = _rank
            scr_write_rank(global.leveltosave)
            scr_play_rank_music()
            obj_savesystem.ini_str = ini_close()
            gamesave_async_save()
        }
        notification_push((5 << 0), [global.leveltosave, global.secretfound, global.level_minutes, global.level_seconds])
        with (obj_achievementtracker)
            event_perform(ev_step, ev_step_normal)
    }
    if (global.timeattack == true)
        obj_timeattack.stop = true
    targetDoor = "none"
    obj_camera.alarm[2] = -1
    var roomname = room_get_name(room)
    var namestring = string_letters(roomname)
    scr_savescore(global.leveltosave)
    if (global.combo > 0)
    {
        global.combotime = 0
        global.combo = 0
        obj_camera.alarm[4] = -1
        for (var i = 0; i < global.comboscore; i += 10)
            create_collect((obj_player1.x + (irandom_range(-60, 60))), (obj_player1.y - 100 + (irandom_range(-60, 60))), choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect), 10)
        global.comboscore = 0
    }
    if (!instance_exists(obj_endlevelfade))
    {
        with (instance_create(x, y, obj_endlevelfade))
        {
            do_rank = true
            toppinvisible = argument0
            if (room == tower_tutorial_1)
            {
                do_rank = false
                targetRoom = tower_entrancehallway
                targetDoor = "HUB"
            }
        }
    }
    obj_player1.state = states.door
    obj_player1.sprite_index = obj_player1.spr_lookdoor
    if instance_exists(obj_player2)
    {
        obj_player2.state = states.door
        obj_player2.sprite_index = obj_player2.spr_lookdoor
        if global.coop
            obj_player2.visible = true
    }
    obj_endlevelfade.alarm[0] = 240
    image_index = 0
    global.panic = false
    global.snickchallenge = false
    global.leveltorestart = -4
    gamesave_async_save()
}

