function scr_player_punch()
{
	if (sprite_index == spr_player_breakdanceuppercut or sprite_index == spr_player_breakdanceuppercutend)
	{
		Move = (key_left + key_right)
		landAnim = 1
		jumpstop = 0
		image_speed = 0.4
		hsp = Movespeed
		if (Move != 0)
		{
			dir = Move
			Movespeed = approach(Movespeed, (Move * 4), 0.5)
		}
		if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_breakdanceuppercut)
			sprite_index = spr_player_breakdanceuppercutend
		if (grounded && vsp > 0 && (sprite_index == spr_player_breakdanceuppercut or sprite_index == spr_player_breakdanceuppercutend))
		{
			if (hsp != 0)
			{
				dir = sign(hsp)
				Xscale = dir
			}
			Movespeed = abs(Movespeed)
			state = states.normal
		}
		if (punch_afterimage > 0)
			punch_afterimage--
		else if (vsp < 0)
		{
			punch_afterimage = 5
			with (create_mach3effect(x, y, sprite_index, image_index))
			{
				image_xscale = other.Xscale
				playerid = other.id
			}
		}
	}
	else
	{
				Move = (key_left + key_right)
				landAnim = 1
				jumpstop = 0
				image_speed = 0.4
				if (breakdance > 0)
					breakdance--
				if (Move != 0)
				{
					if (Move != Xscale && Movespeed > -6)
					{
						if (sprite_index != spr_player_kungfujump)
							Movespeed -= 1
						else
							Movespeed -= 0.1
					}
					else if (Move == Xscale && Movespeed < 6 && sprite_index == spr_player_kungfujump)
						Movespeed += 0.2
				}
				hsp = (Xscale * Movespeed)
				var _kungfuground = (sprite_index == spr_player_kungfu1 or sprite_index == spr_player_kungfu2 or sprite_index == spr_player_kungfu3 or sprite_index == spr_shotgunsuplexdash)
				var _Sjumpcancel = (sprite_index == spr_player_Sjumpcancel or sprite_index == spr_player_Sjumpcancelland or sprite_index == spr_player_Sjumpcancelslide)
				if (_kungfuground && image_index > 7 && (!key_attack) && Movespeed > 0)
					Movespeed -= 0.5
				if (floor(image_index) == (image_number - 1))
				{
					switch sprite_index
					{
						case spr_player_kungfu1:
						case spr_player_kungfu2:
						case spr_player_kungfu3:
						case spr_shotgunsuplexdash:
							state = states.normal
							if (Move != Xscale && Move != 0)
								Movespeed = 2
							break
						case spr_player_kungfuair1transition:
							sprite_index = spr_player_kungfuair1
							break
						case spr_player_kungfuair2transition:
							sprite_index = spr_player_kungfuair2
							break
						case spr_player_kungfuair3transition:
							sprite_index = spr_player_kungfuair3
							break
						case spr_player_Sjumpcancelland:
							sprite_index = spr_player_Sjumpcancelslide
							break
					}

				}
				if ((!_kungfuground) && (!_Sjumpcancel))
				{
					if (grounded && vsp >= 0)
						state = states.normal
				}
				if _Sjumpcancel
				{
					if (grounded && vsp > 0)
					{
						if (sprite_index == spr_player_Sjumpcancel)
						{
							sprite_index = spr_player_Sjumpcancelland
							image_index = 0
						}
						if key_attack
						{
							if (Movespeed >= 12)
								state = states.mach3
							else
								state = states.mach2
							sprite_index = spr_rollgetup
							image_index = 0
						}
						else if (Movespeed > 6)
						{
							state = states.machslide
							sprite_index = spr_machslidestart
							image_index = 0
						}
						else
							state = states.normal
					}
					if (sprite_index == spr_player_Sjumpcancelslide)
						image_speed = (abs(Movespeed) / 15)
				}
				if (sprite_index != spr_player_kungfujump && place_meeting((x + Xscale), y, obj_solid) && (!(place_meeting((x + Xscale), y, obj_destructibles))) && (!(place_meeting((x + Xscale), y, obj_slope))))
				{
					vsp = -4
					sprite_index = spr_player_kungfujump
					image_index = 0
					state = states.punch
					Movespeed = -6
				}
				if punch_afterimage > 0
					punch_afterimage--
				else
				{
					punch_afterimage = 5
					with (create_mach3effect(x, y, sprite_index, image_index))
					{
						image_xscale = other.Xscale;
						playerid = other.id;
					}
				}
				if (!instance_exists(obj_dashcloud2) && grounded && Movespeed > 5)
				{
					with (instance_create(x, y, obj_dashcloud2))
						image_xscale = other.Xscale;
				}
		}
				if (input_buffer_slap > 0 && (!key_up) && sprite_index != spr_suplexbump && shotgunAnim == false && (!global.pistol))
				{
					flash = 1
					fmod_event_one_shot_3d("event:/sfx/pep/grabcancel", x, y)
					sprite_index = spr_player_kungfuair3
					image_index = 0
					Movespeed = 13
				}
				
}

