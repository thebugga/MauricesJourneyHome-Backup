if (global.switchbuffer > 0)
	global.switchbuffer--
if (sprite_index == spr_peppinoswitch2 && animation_end())
{
	with (obj_player1)
	{
		visible = true
		gustavodash = 0
		ratmount_movespeed = 8
		state = states.normal
		brick = 0
		x = obj_peppinoswitch.x
		y = obj_peppinoswitch.y
		global.switchbuffer = 100
	}
	sprite_index = spr_gustavosign
}
