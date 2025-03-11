if (global.panic == true && global.fill > 0 && (!instance_exists(obj_ghostcollectibles)) && (!global.tutorial_room))
    global.fill -= 0.2
if global.fill <= 0 && global.panic && (!global.tutorial_room)
{
	if !instance_exists(obj_pizzamancer)
	{
		instance_create(obj_player1.x, obj_player1.y, obj_pizzamancer)
	    event_play_oneshot("event:/sfx/pizzamancer/laugh")
	}
	obj_camera.collect_shake = 3
	if !P1collector && (global.coop || global.swapmode) && global.collectN > 0
	{
		global.collectN--
		P1collector = !P1collector
	}
	else
	{
		global.collect--
		P1collector = !P1collector
	}
	if global.collect <= 0 && (global.collectN <= 0 && (global.coop || global.swapmode))
	{
		global.collect = 0
		global.collectN = 0
		with (obj_parent_player)
		{
			instance_destroy(obj_fadeout)
			targetDoor = "A"
			room = timesuproom
			state = states.timesup
			sprite_index = spr_Timesup
			image_index = 0
			audio_stop_all()
			//scr_soundeffect(mu_timesup)
		}
		instance_destroy(obj_pizzamancer)
	}
}
if (global.fill <= 0)
    global.fill = 0
