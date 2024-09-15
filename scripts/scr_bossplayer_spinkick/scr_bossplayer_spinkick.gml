function scr_bossplayer_spinkick()
{
	move = (key_left + key_right)
	hsp = Approach(hsp, move * 5, 0.5)
	image_speed = 0.35
	if floor(image_index) == 1 && sprite_index == spr_player_kungfuair2 && !instance_exists(obj_slaphitbox)
	{
		with instance_create(x, y, obj_slaphitbox)
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
	if floor(image_index) == image_number - 1
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