if up
{
	walk_index += 0.35
	if floor(walk_index) == sprite_get_number(walk_sprite) - 1
		walk_index = 0
	v_select = clamp(v_select + (playerid.key_down.pressed - playerid.key_up.pressed), 0, 2)
	h_select[v_select] = clamp(h_select[v_select] + (playerid.key_right.pressed - playerid.key_left.pressed), 0, array_length(v_select == 0 ? clothes_arr : hats_arr) - 1)
	if playerid.key_jump.pressed
	{
		var palette = clothes_arr[h_select[0]].pal_ix
		var pattern = clothes_arr[h_select[0]].pattern
	
		with obj_player
		{
			event_play_oneshot_3d("event:/sfx/misc/clotheswitch", x, y)
		
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
		
			ini_open($"saves/saveData{global.savefile}.ini")
			ini_write_real("Clothes", "palette_index", pal_select)
			ini_write_real("Clothes", "pattern_sprite", pattern_spr)
			ini_close()
		}
		with obj_playerhat
		{
			if playerid == other.playerid
			{
				with instance_create(x, y, obj_enemycorpse)
				{
		            hsp = irandom_range(-5, 5)
		            vsp = irandom_range(-6, -11)
					sprite_index = other.sprite_index
					depth = -400
				}
				
				instance_destroy()
			}
		}
		if h_select[1] != 0
		{
			with instance_create(x, y, obj_playerhat)
			{
				playerid = other.playerid
				sprite_index = other.hats_arr[other.h_select[1]][1]
			}
			quick_ini_write_real($"saves/saveData{global.savefile}.ini", "Clothes", "hat", hats_arr[h_select[1]][1])
		}
		
		
		up = false
		playerid = noone
		obj_player.state = states.normal
	}
}