function scr_bossplayer_spinkick()
{
	Move = (key_left + key_right)
	hsp = approach(hsp, Move * 7, 0.5)
	image_speed = 0.35
	if floor(image_index) == 1 && sprite_index == spr_player_kungfuair2 && !instance_exists(obj_lungehitbox)
	{
		with instance_create(x, y, obj_lungehitbox)
		{
			sweepoff = true
			offsetx = 170
			offsety = 160
			lifetime = 5
			sweepH = -8
			sweepV = -10
		}
	}
	prevframe = image_index
	if animation_end()
	{
		if sprite_index == spr_player_kungfuair2transition
			sprite_index = spr_player_kungfuair2
	}
	if grounded
	{
		state = states.normal
		landAnim = true
	}
}