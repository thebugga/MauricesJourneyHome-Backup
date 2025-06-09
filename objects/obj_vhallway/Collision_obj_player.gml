if !obj_fade.fade 
	event_play_oneshot("event:/sfx/misc/door")
do_fade(t_room, t_door, fade_types.v_hallway)
	
with (obj_player)
{
	dooryscale = sign(other.image_yscale)
	if state = states.climbwall
		wasclimbingwall = true
	break;
}
