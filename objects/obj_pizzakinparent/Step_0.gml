visible = ((room == rank_room or room == timesuproom) ? false : playerid.visible)
if (obj_parent_player.state == states.pizzathrow)
	visible = false
playerid = (obj_player1.spotlight ? obj_player1 : obj_player2)
if (state != states.backbreaker)
{
	if (sprite_index == spr_intro && animation_end())
		sprite_index = spr_idle
	if (sprite_index != spr_intro)
	{
		image_alpha = playerid.image_alpha
		sprite_index = (xprev != x) ? spr_run : spr_idle
		depth = -6
	}
	if (global.panic && sprite_index == spr_idle && !instance_exists(obj_ghostcollectibles))
		sprite_index = spr_panic
}
else
{
	hsp = 0
	vsp = 0
	if (sprite_index != spr_intro)
	{
		var s = obj_player1.sprite_index
		if (s == obj_player1.spr_supertaunt1 or s == obj_player1.spr_supertaunt2 or s == obj_player1.spr_supertaunt3 or s == obj_player1.spr_supertaunt4)
		{
			sprite_index = spr_intro
			image_index = 0
		}
	}
	if (obj_player1.state != states.backbreaker or (sprite_index == spr_intro && animation_end()))
	{
		instance_destroy(obj_tinytaunt)
		interp = 0
		sprite_index = spr_idle
		lock = false
		state = states.normal
	}
}
