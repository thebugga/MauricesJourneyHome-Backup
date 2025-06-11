if up
{
	if walk_sprite == playerid.spr_idle
	{
		walk_index += 0.35
		if floor(walk_index) == sprite_get_number(walk_sprite) - 1
			walk_index = 0
	}
	taunt_index += 0.25
	v_select = clamp(v_select + (playerid.key_down.pressed - playerid.key_up.pressed), 0, 2)
	h_select[v_select] = clamp(h_select[v_select] + (playerid.key_right.pressed - playerid.key_left.pressed), 0, array_length(v_select == 0 ? clothes_arr : hats_arr) - 1)
	
	if playerid.key_taunt.pressed
	{
		event_play_oneshot_3d("event:/sfx/player/taunt", x, y)
		walk_sprite = playerid.spr_taunt
		walk_index = irandom(sprite_get_number(walk_sprite))
		taunt_index = 0
	}
	if taunt_index >= 3
		walk_sprite = playerid.spr_idle
		
	if playerid.key_jump.pressed
	{
		var palette = clothes_arr[h_select[0]].pal_ix
		var pattern = clothes_arr[h_select[0]].pattern
		var hat = hats_arr[h_select[1]][1]
	
		with playerid
		{
			event_play_oneshot_3d("event:/sfx/misc/clotheswitch", x, y)
		
			if palette != pal_select || pattern != pattern_spr
			{
				with instance_create(x, y, obj_enemycorpse)
				{
					pal_select = other.pal_select
					pattern_spr = other.pattern_spr
					dopalette = true
		            hsp = irandom_range(-5, 5)
		            vsp = irandom_range(-6, -11)
					sprite_index = spr_palettedresserdebris
					depth = -400
				}
		
				pal_select = palette
				pattern_spr = pattern
			}
		
			if hat != hat_spr
			{
				with instance_create(x, y, obj_enemycorpse)
				{
				    hsp = irandom_range(-5, 5)
				    vsp = irandom_range(-6, -11)
					sprite_index = other.hat_spr
					depth = -400
				}
				
				hat_spr = hat
			}
			
			ini_open($"saves/saveData{global.savefile}.ini")
			ini_write_real($"Clothes{character}", "palette_index", pal_select)
			ini_write_real($"Clothes{character}", "pattern_sprite", pattern_spr)
			ini_write_real($"Clothes{character}", "hat", hat_spr)
			ini_close()
		}
		
		
		up = false
		playerid = noone
		obj_player.state = states.normal
	}
	
}