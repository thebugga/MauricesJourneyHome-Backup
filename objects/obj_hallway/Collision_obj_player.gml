if !obj_fade.fade 
	event_play_oneshot("event:/sfx/misc/door")
do_fade(t_room, t_door, fade_types.hallway)
obj_player.doorxscale = sign(image_xscale)
