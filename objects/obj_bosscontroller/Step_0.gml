switch state
{
	case BCstates.arenaintro:
		with (obj_bossplayer)
			state = states.noclip
		if (intro_buffer > 0)
			intro_buffer--
		else
			state = BCstates.arenaround
		break
	
	case BCstates.arenaround:
		var round_yto = screen_h - 50
		round_y = approach(round_y, round_yto, 7)
		if (round_y != round_yto)
			round_x = (round_xstart + irandom_range(-1, 1))
		if (timer_buffer > 0)
		{
			round_timer = approach(round_timer, round_timermax, 60)
			timer_buffer--
			with (obj_bossplayer)
			{
				if (state != states.actor && state != states.hit && !obj_fade.fade)
				{
					if (state == states.hit)
					{
						prev.lag = 0
						x = prev.x
						y = prev.y
					}
					state = states.actor
					movespeed = 0
					hsp = 0
					vsp = 0
					sprite_index = spr_idle
					image_speed = 0.35
					image_xscale = (x > (room_width / 2) ? -1 : 1)
					image_blend = make_colour_hsv(0, 0, 255)
					visible = true
					image_alpha = 1
				}
			}
		}
		else
		{
			minutes = maxminutes
			seconds = maxseconds
			round_timer = round_timermax
			alarm[0] = 1
			state = BCstates.normal
			with (obj_bossplayer)
			{
				state = states.normal
				hsp = 0
				reset_anim(spr_idle)
			}
		}
		break
	
	case BCstates.normal:
		round_y = approach(round_y, screen_h, 7)
		bg_super_y -= 20
		if (bg_super_y < -540)
			bg_super_y = 0
		switch super_portrait_state
		{
			case 0:
				super_portrait_index = 0
				super_portrait_x = super_portrait_x_off
				break
			case 1:
				super_portrait_index += 0.35
				super_portrait_x = approach(super_portrait_x, super_portrait_xstart, 40)
				if (super_portrait_x == super_portrait_xstart)
					super_portrait_state = 2
				break
			case 2:
				super_portrait_index += 0.35
				super_portrait_x += 1
				break
		}
		break
		
	case BCstates.victory:
	case BCstates.gameover:
		fade -= 0.05
		fade = clamp(fade, 0, 1)
		break
}


var playcount = 0
var playX = 0
var playY = 0
with obj_bossplayer
{
	playX += x
	playY += y
	playcount++
}
camera_set_view_pos(view_camera[0], playX / playcount, playY / playcount)