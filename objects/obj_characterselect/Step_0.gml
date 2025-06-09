image_speed = 0.35

if !stopper
{
	get_input(0)
	
	if !ready[0]
	{
		selected[0] = clamp(selected[0] + (-key_up.pressed + key_down.pressed), 0, array_length(character) - 1)
		
		p1_sprite = character[selected[0]][2]
		if (key_jump.pressed)
		{
			ready[0] = true
			event_play_oneshot("event:/sfx/misc/collecttoppin")
			p1_sprite = character[selected[0]][3]
			p1_index = 0
		}
	}
	if (key_grab.pressed && ready[0])
	{
		ready[0] = false
		event_play_oneshot("event:/sfx/player/hurt")
	}
	
	if key_taunt.pressed && p2_connect
	{
		multimode = !multimode
		mode_scale = 2
	}
	get_input(1)
	
	if p1_boxheight == 220
	{
		if !ready[1]
		{
			selected[1] = clamp(selected[1] + (-key_up.pressed + key_down.pressed), 0, array_length(character) - 1)
			
			p2_sprite = character[selected[1]][2]
			if (key_jump.pressed)
			{
				if selected[0] != selected[1]
				{
					ready[1] = true
					//scr_soundeffect(sfx_collecttoppin)
					p2_sprite = character[selected[1]][3]
					p2_index = 0
				}
			}
		}
		if (key_grab.pressed)
		{
			if ready[1]
			{
				ready[1] = false
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
	
	if ready[0] && ready[1] == p2_connect
	{
			instance_activate_object(obj_player)
			var xx = 0
			var yy = 0
			with (obj_player)
			{
				character = other.character[other.selected[player]][1]
				scr_character_spr()
				if player == 0
				{
					xx = x
					yy = y
				}
				else
				{
					x = xx
					y = yy
				}
				
			}
			instance_deactivate_object(obj_player)
			
			global.multiplayer = p2_connect + (multimode * p2_connect)
			
			event_play_oneshot("event:/sfx/misc/collecttoppin")
			alarm[0] = 100
			stopper = true
	}
}
if floor(p1_index) == (sprite_get_number(p1_sprite) - 1)
{
	if p1_sprite == character[selected[0]][2]
		p1_index = 0
}
else
	p1_index += 0.35
if floor(p2_index) == (sprite_get_number(p2_sprite) - 1)
{
	if p2_sprite == character[selected[1]][2]
		p2_index = 0
}
else
	p2_index += 0.35