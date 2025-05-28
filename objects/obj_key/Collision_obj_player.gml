with other
{
    global.combo.timer = 60
	
	movespeed = 0
	hsp = 0
	vsp = 0
	state = states.actor
	
	if other.visible
	{
		other.visible = false
		image_speed = 0.35
		reset_anim(obj_player.spr_keyget)
		event_play_oneshot("event:/sfx/misc/collecttoppin")
	}
	
	if anim_ended()
	{
		instance_destroy(other)
		state = states.normal
		haskey = true
		instance_create(other.x, other.y, obj_keyfollow)
	}
}
