image_speed = 0.35

if !stopper
{
	get_input()
	
	if !ready
	{
		selected = clamp(selected + (-key_up.pressed + key_down.pressed), 0, array_length(character) - 1)
		
		p1_sprite = character[selected][2]
		if (key_jump.pressed)
		{
			ready = true
			//scr_soundeffect(sfx_collecttoppin)
			p1_sprite = character[selected][3]
			p1_index = 0
		}
	}
	if (key_grab.pressed && ready)
	{
		ready = false
		//scr_soundeffect(sfx_hurt1)
	}
	
	/*
	if key_taunt.pressed && p2_connect
	{
		multimode = !multimode
		mode_scale = 2
	}
	get_input()
	
	if p1_boxheight == 220
	{
		if !ready2
		{
			selected = clamp(selected + (-key_up.pressed + key_down.pressed), 0, array_length(character) - 1)
			
			p2_sprite = character[selected2][2]
			if (key_jump.pressed)
			{
				if selected != selected2
				{
					ready2 = true
					//scr_soundeffect(sfx_collecttoppin)
					p2_sprite = character[selected2][3]
					p2_index = 0
				}
			}
		}
		if (key_grab.pressed)
		{
			if ready2
			{
				ready2 = false
				//scr_soundeffect(sfx_hurt1)
			}
			else
			{
				p2_connect = false
				//scr_soundeffect(sfx_hurt1)
			}
		}
	}
	if (key_jump.pressed)
		p2_connect = true
	*/
	if ready && ready2 == p2_connect
	{
			with (obj_player)
			{
				character = other.character[other.selected][1]
				scr_character_spr()
			}
			
			global.coop = p2_connect && !multimode
			global.swapmode = p2_connect && multimode
			
			//scr_soundeffect(sfx_collecttoppin)
			alarm[0] = 100
			stopper = true
	}
}
if floor(p1_index) == (sprite_get_number(p1_sprite) - 1)
{
	if p1_sprite == character[selected][2]
		p1_index = 0
}
else
	p1_index += 0.35
if floor(p2_index) == (sprite_get_number(p2_sprite) - 1)
{
	if p2_sprite == character[selected2][2]
		p2_index = 0
}
else
	p2_index += 0.35