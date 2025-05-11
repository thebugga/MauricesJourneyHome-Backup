with instance_place(x, y, obj_player)
{
	if (!global.panic.active && anim_ended() && sprite_index == spr_exitdoor && !global.panic.active)
	{
		shake_camera()
		reset_anim(obj_player.spr_Timesup)
		other.image_index++
		scr_sound_3d(sfx_groundpound, x, y)
		global.doorshut = true
		if instance_exists(obj_titlecard)
		{
			obj_titlecard.x = x
			obj_titlecard.y = y
			obj_titlecard.alarm[0] = 20
		}
	}
	else if (global.panic.active && key_up.down && grounded && state != states.taunt)
	{
		global.panic.active = false
		do_the_rank()
	}
}
