function scr_enemy_rage()
{
	switch object_index
	{
		case obj_forknight:
			image_speed = 0.6
			if (sprite_index == spr_forknight_ragestart)
			{
				hsp = 0
				if (image_index > (image_number - 1))
				{
					sprite_index = spr_forknight_rageloop
					image_index = 0
				}
			}
			else if (sprite_index == spr_forknight_rageloop)
			{
				hsp = (image_xscale * (4 + (global.baddiespeed - 1)))
				with (instance_place((x + hsp), y, obj_destructibles))
					instance_destroy()
				if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_slope))))
				{
					state = states.stun
					stunned = 100
					vsp = -8
					hsp = ((-image_xscale) * 5)
				}
			}
			break
		case obj_miniufo:
			if (floor(image_index) == 3 && shoot == 0)
			{
				shoot = 1
				instance_create(x, y, obj_warplaserhoming)
			}
			if (floor(image_index) == (image_number - 1))
				state = states.walk
			break
		case obj_cheeseslime:
			if (floor(image_index) > 10)
			{
				hsp = (image_xscale * 8)
				with (instance_create(x, y, obj_parent_enemyragehitbox))
				{
					ID = other.id
					image_xscale = other.image_xscale
				}
			}
			else
				hsp = 0
			if (floor(image_index) == (image_number - 1))
			{
				state = states.walk
				sprite_index = walkspr
			}
			break
		case obj_minijohn:
			hsp = (Movespeed * image_xscale)
			if (sprite_index == spr_minijohn_rage1 && floor(image_index) == (image_number - 1))
				sprite_index = spr_minijohn_rage2
			if (grounded && vsp > 0)
			{
				var targetplayer = obj_player1
				if (obj_player1.spotlight == 0)
					targetplayer = 323
				Movespeed = 4
				image_xscale = (-(sign((x - targetplayer.x))))
				state = states.chase
				sprite_index = spr_minijohn_charge
			}
			break
			/*
		case obj_fencer:
			var thespeed = 0
			if (image_index > 7)
				thespeed = 12
			hsp = (image_xscale * thespeed)
			if (floor(image_index) == (image_number - 1))
			{
				with (instance_create(x, y, obj_forkhitbox))
					ID = other.id
				charging = 1
				state = states.charge
				Movespeed = 5
				vsp = -7
				sprite_index = spr_fencer_chargestart
			}
			break
			*/
		case obj_ancho:
			hsp = 0
			if (sprite_index == spr_ancho_rage1)
				vsp = 0
			if (sprite_index == spr_ancho_rage2)
				vsp = 10
			if (floor(image_index) == (image_number - 1) && sprite_index == spr_ancho_rage1)
				sprite_index = spr_ancho_rage2
			if (grounded && sprite_index == spr_ancho_rage2)
			{
				with (obj_camera)
				{
					shake_mag = 10
					shake_mag_acc = (30 / room_speed)
				}
				image_index = 0
				sprite_index = spr_ancho_rage3
			}
			if (floor(image_index) == (image_number - 1) && sprite_index == spr_ancho_rage3)
			{
				state = states.walk
				sprite_index = spr_ancho
			}
			break
	}

	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		hsp += (_railinst.Movespeed * _railinst.dir)
	}
	exit;
}

