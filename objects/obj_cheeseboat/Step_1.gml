if place_meeting(x, y - 2, obj_parent_player) && !place_meeting(x, y, obj_parent_player)
{
	var player = instance_place(x, y - 2, obj_parent_player)
	if hsp == 0 && player.hsp != 0 && player.grounded && !place_meeting(x + player.hsp, y, par_collision)
	{
		hsp = player.hsp
		with player
		{
	        tauntstoredmovespeed = movespeed
	        tauntstoredsprite = sprite_index
	        tauntstoredstate = state
			state = states.actor
			hsp = 0
			sprite_index = spr_player_grind
			image_index = 0
			image_speed = 0.35
		}
	}
	if hsp != 0 && place_meeting(x, y, par_collision)
	{
		hsp = 0
		image_xscale *= -1
		do
			trueX += image_xscale
		until !place_meeting(trueX, y, par_collision)
		with player
		{
			state = tauntstoredstate
			movespeed = tauntstoredmovespeed
			vsp = -8
			sprite_index = tauntstoredsprite
			image_index = 0
		}
	}
}