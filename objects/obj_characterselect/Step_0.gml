image_speed = 0.35
if !stopper
{
	if !ready
	{
		if ((obj_player1.key_down2) && selected < (array_length(character) - 1))
		{
			selected += 1
			//scr_soundeffect(sfx_step)
		}
		if ((obj_player1.key_up2) && selected > 0)
		{
			selected -= 1
			//scr_soundeffect(sfx_step)
		}
		p1_sprite = character[selected][2]
		if (obj_player1.key_jump)
		{
			ready = true
			//scr_soundeffect(sfx_collecttoppin)
			p1_sprite = character[selected][3]
			p1_index = 0
		}
	}
	if (obj_player1.key_slap2 && ready)
	{
		ready = false
		//scr_soundeffect(sfx_hurt1)
	}
	if p1_boxheight == 220
	{
		if !ready2
		{
			if ((obj_player2.key_down2) && selected2 < (array_length(character) - 1))
			{
				selected2 += 1
				//scr_soundeffect(sfx_step)
			}
			if ((obj_player2.key_up2) && selected2 > 0)
			{
				selected2 -= 1
				//scr_soundeffect(sfx_step)
			}
			p2_sprite = character[selected2][2]
			if (obj_player2.key_jump)
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
		if (obj_player2.key_slap2)
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
		if obj_player1.key_taunt2
		{
			multimode = !multimode
			mode_scale = 2
		}
	}
	/*
	if (obj_player2.key_jump)
		p2_connect = true
	*/
	if ready && ready2 == p2_connect
	{
			with (obj_player1)
			{
				global.playerCharacter = other.character[other.selected][1]
				scr_characterspr()
			}
			with (obj_player2)
			{
				//global.playerCharacter = other.character[other.selected2][1]
				scr_characterspr()
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
if shadowtimer > 0
	shadowtimer--
else
{
	var _scale = choose(-1, 1)
	var q = 
	{
		index: choose_non_repeat(charactersprites),
		scale: _scale,
		x: 480 - (1000 * _scale),
		y: 370,
		Movespeed: irandom_range(2, 5),
		vsp: 0
	}
	ds_list_add(shadows, q)
	shadowtimer = irandom(1000)
}