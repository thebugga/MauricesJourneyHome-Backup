sprite_index = spr_playerN_idle
deathspr = spr_playerN_hurt
deathsavename = "undoised"
if (global.bombcutscene == -4)
	global.bombcutscene = quick_ini_read_real(get_savefile_ini(), "Cutscene", "bomb", 0)
if global.bombcutscene
{
	scene_info = [[cutscene_do_dialog, [dialog_create("Oh! Blockade that soon be gotten gone-gone-done when bomb the tows!", 1, 0)], [0, -4, -4, -4], [1, -4, -4, -4]], [cutscene_waitfor_dialog], [cutscene_set_player_actor], [cutscene_wait, 20], [function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_222_gml_RoomCC_hub_industrialcomplex_2_Create
	{
	    doisey = obj_dialognpc.id
	    with (doisey)
	    {
			if sprite_index != spr_playerN_noisebombthrow
			{
		        sprite_index = spr_playerN_noisebombthrow
				image_index = 0
				if !instance_exists(obj_pizzagoblinbomb)
				{
					with (instance_create(x, y, obj_pizzagoblinbomb))
			        {
			            defused = true
			            state = states.normal
			            movespeed = 6
			            vsp = -6
			        }
				}
			}
			if floor(image_index) >= sprite_get_number(sprite_index) - 1
			{
				sprite_index = spr_playerN_idle
	            with (other)
					cutscene_end_action()
			}
	    }
		with (obj_player)
		{
			if visible
			{
				visible = false
				with (instance_create(x, y, obj_actor))
				{
					use_palette = 1
					spr_palette = other.spr_palette
					paletteselect = other.paletteselect
					depth = other.depth
					image_speed = 0.35
					sprite_index = other.spr_idle
					image_xscale = other.xscale
				}
			}
		}
	}
	], [cutscene_wait, 30], [function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_874_gml_RoomCC_hub_industrialcomplex_2_Create
	{
	    with (doisey)
	    {
			if (x > 544)
			{
		        sprite_index = spr_playerN_move
				x -= 4
				image_xscale = -1
			}
			if (x <= 544)
		    {
		        sprite_index = spr_playerN_idle
				image_xscale = 1
			}
	    }
		with (obj_actor)
	    {
			if (x > 480)
			{
		        sprite_index = spr_player_move
				x -= 4
				image_xscale = -1
			}
			if (x <= 480)
		    {
		        sprite_index = spr_player_idle
				image_xscale = 1
			}
	    }
		if (doisey.x <= 544 && obj_actor.x <= 480)
	            cutscene_end_action()
	}
	], [function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_480_gml_RoomCC_hub_industrialcomplex_2_Create
	{
	    if (!instance_exists(obj_pizzagoblinbomb))
		{
			with (obj_solidpillar)
				instance_destroy()
	        cutscene_end_action()
		}
	}
	], [cutscene_wait, 50], [cutscene_do_dialog, [dialog_create("Ecstatic! You see around I will soon.", 1, 0, function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_670_gml_RoomCC_hub_industrialcomplex_2_Create
	{
	    global.doisecutscene1 = true
	    quick_ini_write_real(get_savefile_ini(), "cutscene", "doise1", true)
	}
	)], [0, -4, -4, -4], [1, -4, -4, -4]], [cutscene_waitfor_dialog], [cutscene_set_player_actor], [function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_874_gml_RoomCC_hub_industrialcomplex_2_Create
	{
	    with (doisey)
	    {
	        sprite_index = spr_playerN_move
			x += 10
	        if (x >= room_width + 50)
	        {
	            instance_destroy(self, false)
				obj_player1.x = obj_actor.x
				instance_destroy(obj_actor)
				obj_player1.visible = true
	            with (other)
	                cutscene_end_action()
	        }
	    }
	}
	], [cutscene_set_player_normal]]
	dialog_func = function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_1097_gml_RoomCC_hub_industrialcomplex_2_Create
	{
	    do_dialog_cutscene(scene_info)
	}
}
else
{
	dialog[0] = dialog_create("This that pillar the on way, prevent myself needed to have through. Help!", 1, 0)
	dialogsidel = [0, -4, -4, -4]
	dialogsider = [1, -4, -4, -4]
}
if (global.doisecutscene1 == -4)
	global.doisecutscene1 = quick_ini_read_real(get_savefile_ini(), "Cutscene", "doise1", 0)
if (global.doisecutscene1)
	instance_destroy()