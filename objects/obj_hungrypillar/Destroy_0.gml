
if room == rm_editor
	exit;

if ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == false
{
	with obj_parent_enemy
	{
		if escape == true
		{
			visible = true
			instance_create(x, y, obj_genericpoofeffect)
		}
	}
	
	global.fill = 4000 // time left in frames
	with obj_tv
		chunkmax = global.fill
	
	with obj_escapecollect
		image_alpha = 1
	with obj_escapecollectbig
		image_alpha = 1
	//scr_soundeffect(sfx_escaperumble)
	//scr_soundeffect(sfx_pillarimpact)
	obj_camera.alarm[1] = 60
	instance_create(x, y, obj_flash)
	instance_create(x, y, obj_bangeffect)
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_baddiegibs)
	instance_create(x, y, obj_baddiegibs)
	instance_create(x, y, obj_baddiegibs)
	
	global.combotime = 60
	global.combo++
	
	if global.coop == true
	{
		obj_player1.x = x
		obj_player2.x = x
		obj_player1.y = y
		obj_player2.y = y
	}
	with obj_camera
	{
		shake_mag = 3
		shake_mag_acc = (3 / room_speed)
	}
	
	instance_destroy()
	for (var i = 0; i < image_yscale; i++)
	{
		var spr = asset_get_index(concat("spr_hungrypillar_dead", totem_face[i]))
		if (spr > -1)
		{
			with instance_create(x, ((bbox_top + 64) + (128 * i)), obj_sausageman_dead)
				sprite_index = spr
		}
	}
	//scr_soundeffect(sfx_killenemy)
	instance_create(x, y + 600, obj_itspizzatime)
	global.panic = true
	
	switch room
	{
		case custom_lvl_room:
			global.minutes = 2
			global.seconds = 15
			break
		default:
			global.minutes = 5
			global.seconds = 30
			break
	}
	ds_list_add(global.saveroom, id)
	idkanymore = 0
}

