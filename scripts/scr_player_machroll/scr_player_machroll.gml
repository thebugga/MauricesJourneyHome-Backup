function scr_player_machroll()
{
	if (!(place_meeting(x, (y + 1), obj_railparent)))
		hsp = (Xscale * movespeed)
	else
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		hsp = ((Xscale * movespeed) + (_railinst.movespeed * _railinst.dir))
	}
	mach2 = 100
	machslideAnim = 1
	move = (key_right + key_left)
	switch character
	{
		case "P":
			if (place_meeting_solid((x + Xscale), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) or place_meeting_slope((x + sign(hsp)), y)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
			{
				//scr_soundeffect(sfx_bumpwall)
				hsp = 0
				image_speed = 0.35
				flash = 0
				combo = 0
				state = states.bump
				hsp = -2.5
				vsp = -3
				mach2 = 0
				image_index = 0
				instance_create((x + 10), (y + 10), obj_bumpeffect)
				mask_index = spr_player_mask
				if place_meeting_solid(x, y)
				{
					var ty = try_solid(0, 1, 312, 32)
					if (ty != -1)
						y += ty
				}
			}
			if ((!instance_exists(dashcloudid)) && grounded)
			{
				with (instance_create(x, (y + 43), obj_cloudeffect))
				{
					image_xscale = other.Xscale
					other.dashcloudid = id
				}
			}
			if (grounded && sprite_index != spr_playerV_divekickstart)
				sprite_index = ((!skateboarding) ? spr_machroll : spr_clowncrouch)
			else if (sprite_index != spr_dive && (!skateboarding))
			{
				sprite_index = spr_dive
				vsp = 10
			}
			if slopeCheck(x + Xscale, y)
				movespeed += 0.1
			image_speed = 0.8
			if ((!key_down) && (!(place_meeting_solid((x + 27), (y - 32)))) && (!(place_meeting_solid((x - 27), (y - 32)))) && (!(place_meeting_solid(x, (y - 32)))) && (!(place_meeting_solid(x, (y - 16)))))
			{
				image_index = 0
				if grounded
				{
					//scr_soundeffect(sfx_rollgetup)
					sprite_index = spr_rollgetup
				}
				if (movespeed < 12 or skateboarding == 1)
				{
					if (!grounded)
						sprite_index = spr_mach
					state = states.mach2
				}
				else
				{
					if (!grounded)
						sprite_index = spr_mach4
					state = states.mach3
				}
			}
			if (skateboarding && movespeed < 12)
				movespeed += 0.5
			break
		case "V":
			if (sprite_index == spr_playerV_divekickstart && floor(image_index) == (image_number - 1))
				sprite_index = spr_playerV_divekick
			if (place_meeting_solid((x + 1), y) && Xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
			{
				//scr_soundeffect(sfx_bumpwall)
				hsp = 0
				image_speed = 0.35
				flash = 0
				combo = 0
				state = states.bump
				hsp = -2.5
				vsp = -3
				mach2 = 0
				image_index = 0
				instance_create((x + 10), (y + 10), obj_bumpeffect)
			}
			if (place_meeting_solid((x - 1), y) && Xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
			{
				//scr_soundeffect(sfx_bumpwall)
				hsp = 0
				image_speed = 0.35
				flash = 0
				combo = 0
				state = states.bump
				hsp = 2.5
				vsp = -3
				mach2 = 0
				image_index = 0
				instance_create((x - 10), (y + 10), obj_bumpeffect)
			}
			if ((!instance_exists(dashcloudid)) && grounded)
			{
				with (instance_create(x, (y + 43), obj_cloudeffect))
				{
					image_xscale = other.Xscale
					other.dashcloudid = id
				}
			}
			if (grounded && sprite_index != spr_playerV_divekickstart)
				sprite_index = spr_machroll
			else if (sprite_index != spr_dive)
			{
				sprite_index = spr_dive
				vsp = 10
			}
			image_speed = 0.8
			if ((!key_down) && (!(place_meeting_solid((x + 27), (y - 32)))) && (!(place_meeting_solid((x - 27), (y - 32)))) && (!(place_meeting_solid(x, (y - 32)))) && (!(place_meeting_solid(x, (y - 16)))))
			{
				image_index = 0
				//scr_soundeffect(sfx_rollgetup)
				state = states.mach2
				sprite_index = spr_rollgetup
			}
			break
		case "N":
			if (place_meeting_solid((x + 1), y) && Xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
			{
				//scr_soundeffect(sfx_bumpwall)
				hsp = 0
				image_speed = 0.35
				flash = 0
				combo = 0
				state = states.bump
				hsp = -2.5
				vsp = -3
				mach2 = 0
				image_index = 0
				instance_create((x + 10), (y + 10), obj_bumpeffect)
			}
			if (place_meeting_solid((x - 1), y) && Xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
			{
				//scr_soundeffect(sfx_bumpwall)
				hsp = 0
				image_speed = 0.35
				flash = 0
				combo = 0
				state = states.bump
				hsp = 2.5
				vsp = -3
				mach2 = 0
				image_index = 0
				instance_create((x - 10), (y + 10), obj_bumpeffect)
			}
			if (((!key_down) or (!grounded)) && (!(place_meeting_solid((x + 27), (y - 32)))) && (!(place_meeting_solid((x - 27), (y - 32)))) && (!(place_meeting_solid(x, (y - 32)))) && (!(place_meeting_solid(x, (y - 16)))))
			{
				image_index = 0
				//scr_soundeffect(sfx_rollgetup)
				state = states.mach3
				sprite_index = spr_playerN_jetpackboost
			}
			if ((!instance_exists(dashcloudid)) && grounded)
			{
				with (instance_create(x, (y + 43), obj_cloudeffect))
				{
					image_xscale = other.Xscale
					other.dashcloudid = id
				}
			}
			image_speed = 0.8
			break
	}

	exit;
}

