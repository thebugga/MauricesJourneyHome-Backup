function scr_maurice_jump()
{
	move = key_right - key_left
	image_speed = 0.35
		hsp = xscale * movespeed
		if move != 0 && !key_attack
		{
			xscale = move
			movespeed = 4
		}
		if move = 0
		{
			movespeed = 0
		}
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_jump)
			sprite_index = spr_fall
		if grounded 
		{
			image_index = 0
		    sprite_index = spr_idle
			state = states.normal
		}
}