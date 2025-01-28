function scr_pizzagoblin_throw()
{
	if (!variable_global_exists("throw_frame"))
	{
		global.throw_frame = 0
		global.throw_frame[obj_cheeserobot] = 6
		global.throw_frame[obj_trash] = 2
		global.throw_frame[obj_robot] = 2
		global.throw_frame[obj_pizzard] = 6
		global.throw_frame[obj_pepgoblin] = 3
		global.throw_frame[obj_swedishmonkey] = 15
		global.throw_frame[obj_miniufo] = 3
		global.throw_frame[obj_kentukybomber] = 7
		global.throw_frame[obj_miniufo_grounded] = 11
		
		global.throw_sprite = 0
		global.throw_sprite[obj_cheeserobot] = spr_cheeserobot_attack
		global.throw_sprite[obj_robot] = spr_robot_attack
		global.throw_sprite[obj_pizzard] = spr_pizzard_shoot
		global.throw_sprite[obj_pepgoblin] = spr_pepgoblin_kick
		global.throw_sprite[obj_swedishmonkey] = spr_swedishmonkey_eat
		global.throw_sprite[obj_miniufo] = spr_ufolive_shoot
		global.throw_sprite[obj_kentukybomber] = spr_kentukybomber_attack
		global.throw_sprite[obj_miniufo_grounded] = spr_ufogrounded_shoot
		
		global.reset_timer = 0
		global.reset_timer[obj_cheeserobot] = 200
		global.reset_timer[obj_trash] = 100
		global.reset_timer[obj_robot] = 150
		global.reset_timer[obj_pizzard] = 100
		global.reset_timer[obj_pepgoblin] = 200
		global.reset_timer[obj_swedishmonkey] = 200
		global.reset_timer[obj_miniufo] = 100
		global.reset_timer[obj_kentukybomber] = 100
		global.reset_timer[obj_miniufo_grounded] = 100
	}
	hsp = 0
	if place_meeting(x, y + 1, obj_railh)
		hsp = -5
	else if place_meeting(x, y + 1, obj_railh2)
		hsp = 5
	
	if floor(image_index) == image_number - 1
	{
		state = states.walk
		sprite_index = walkspr
	}
	
	if bombreset <= 0 && floor(image_index) == global.throw_frame[object_index]
	{
		bombreset = global.reset_timer[object_index]
		sprite_index = global.throw_sprite[object_index]
		if point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
			scr_soundeffect(sfx_enemyprojectile)
		
		switch object_index
		{
			case obj_cheeserobot:
				with (instance_create(x, y, obj_arcprojectile))
				{
					sprite_index = spr_junk
					image_index = irandom(sprite_get_number(spr_junk))
					image_speed = 0
					image_xscale = other.image_xscale
					hsp = (image_xscale * 6)
					vsp = -8
				}
				break
			case obj_robot:
				with (instance_create((x + (image_xscale * 4)), y, obj_robotknife))
				{
					grav = 0
					image_xscale = other.image_xscale
					hsp = (other.image_xscale * 5)
				}
				break
			case obj_pizzard:
				with (instance_create(x, y, obj_pizzard_bolt))
					image_xscale = other.image_xscale
				break
			case obj_swedishmonkey:
				if elite
				{
					with (instance_create(x, y, obj_evilbanana))
					{
						baddieID = other.id
						image_xscale = other.image_xscale
						hsp = (other.image_xscale * 4)
						vsp = -5
					}
				}
				else
				{
					with (instance_create(x, y, obj_slipnslide))
					{
						baddieID = other.id
						image_xscale = other.image_xscale
						hsp = (other.image_xscale * 4)
						vsp = -5
					}
				}
				with (obj_slipnslide)
				{
					if (baddieID == other.id)
						banana += 1
				}
				with (obj_evilbanana)
				{
					if (baddieID == other.id)
						banana += 1
				}
				break
			case obj_pepgoblin:
				with (instance_create(x, y, obj_pepgoblin_kickhitbox))
				{
					baddieID = other.id
					image_xscale = other.image_xscale
				}
				break
			case obj_miniufo:
				instance_create(x, y, obj_warplaser)
				break
			case obj_miniufo_grounded:
				with (instance_create((x + (8 * image_xscale)), y, obj_enemybullet))
				{
					sprite_index = spr_ufogrounded_bullet
					image_xscale = other.image_xscale
				}
				break
			case obj_kentukybomber:
				instance_create(x, (y + 70), obj_kentukybomb)
				break
		}

	}
	if ((!grounded) && hsp < 0)
		hsp += 0.1
	else if ((!grounded) && hsp > 0)
		hsp -= 0.1
	exit;
}

