function player_taunt()
{
	hsp = 0
	vsp = 0
	
	var endtaunt = false
	
	if !string_starts_with(sprite_get_name(sprite_index), "spr_player_supertaunt")
	{
		if key_up.down && supertauntshow
		{
			reset_anim(asset_get_index($"spr_player_supertaunt{irandom_range(1, 4)}"))
			var spds = [[0, -1], [1, -1], [1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0], [-1, -1]]
			var i = 0
			var spd = 20
			repeat 8
			{
				with particle_create(x, y, particles.sparks)
				{
					hsp = spds[i][0] * spd
					vsp = spds[i][1] * spd
				}
				i++
			}
			exit;
		}
		
		if taunttimer > 0
			taunttimer--
		else
			endtaunt = true
	}
	else
	{
		supertauntcount = 0
		supertauntshow = false
		shake_camera(10, room_speed / 60)
		image_speed = 0.2
		
		if anim_ended()
		{
			endtaunt = true
			if character == p_characters.undoised
			{
				with par_enemy
				{
					if (bbox_in_camera() && enemy_can_die())
					{
						array_push(obj_backbloodhandler.doise_bloods, {
							myroom: room,
							index: 0,
							x: x,
							y: y,
							scale: random_range(1,2),
							rotate: irandom(360)
						})
						repeat 20
							particle_create(x, y, particles.blood)
						repeat 10
							instance_create(x, y, obj_doisegib)
						repeat 100
							instance_create(x, y, obj_lagblood)
						ds_list_add(!escape ? global.ds_save_room : global.ds_escapesaveroom, id)
						instance_destroy(self, false)
					}
				}
			}
		}
	}
	
	if endtaunt
	{
		state = prev.state
		vsp = prev.vsp + grav
		sprite_index = prev.sprite_index
	}
}
