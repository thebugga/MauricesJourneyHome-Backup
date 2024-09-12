function scr_bossplayer_normal()
{
	move = (key_left + key_right)
	if grounded && sprite_index != spr_jumpprep && sprite_index != spr_land && sprite_index != spr_duck && sprite_index != spr_punch
	{
		image_speed = 0.5
		hsp = move * 4
		if hsp == 0
			sprite_index = spr_idle
		else
			sprite_index = spr_move
		if key_jump
		{
			hsp = 0
			sprite_index = spr_jumpprep
			image_index = 0
			image_speed = 0.35
		}
		if key_down
		{
			hsp = 0
			sprite_index = spr_duck
		}
		if key_slap
		{
			hsp = 0
			sprite_index = spr_punch
			with instance_create(x, y, obj_slaphitbox)
			{
				visible = true
				offsetx = 170
				offsety = 30
			}
		}
		
	}
	if floor(image_index) == image_number - 1
	{
		if sprite_index == spr_jumpprep
		{
			hsp = move * 5
			vsp = -15
			sprite_index = spr_jump
			image_index = 0
			landAnim = true
		}
		if sprite_index == spr_jump
			sprite_index = spr_fall
		if sprite_index == spr_land || sprite_index == spr_punch
			sprite_index = spr_idle
	}
	if vsp >= 0 && grounded && landAnim
	{
		hsp = 0
		sprite_index = spr_land
		image_index = 0
		landAnim = false
	}
	if !key_down && sprite_index == spr_duck
	{
		sprite_index = spr_idle
	}
}