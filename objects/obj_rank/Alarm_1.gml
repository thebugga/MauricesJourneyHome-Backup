room_goto(tower_hallway)
reset_level()
with obj_player
{
	x = return_location.x
	y = return_location.y
	state = states.actor
	spawn = noone
	room_goto(return_location.room)
	reset_anim(obj_player.spr_exitdoor)
}

