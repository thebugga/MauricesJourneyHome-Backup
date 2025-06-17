room_goto(tower_hallway)
reset_level()
with obj_player
{
	spawn = noone
	x = return_location.x
	y = return_location.y
	room_goto(return_location.room)
	state = states.actor
	reset_anim(obj_player.spr_exitdoor)
}

