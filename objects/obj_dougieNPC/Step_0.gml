if (!global.dougiecutscene2)
{
    with (obj_parent_player)
    {
        if (x > 800)
		{
			x = 800
			hsp = 0
			do_dialog_cutscene([[cutscene_set_player_actor], [cutscene_player_check_ground, id], [cutscene_do_dialog, [dialog_create("HEY!", 3, 0), dialog_create("Stay away from my Big Screen TV, that thing's priceless!", 3, 0)], [0, -4, -4, -4], [3, -4, -4, -4]], [cutscene_waitfor_dialog], [cutscene_set_player_actor], [cutscene_Move_player, id, 288, 8, 12], [cutscene_set_player_normal]])
		}
    }
}
if (global.dougiecutscene1 == -4)
	global.dougiecutscene1 = quick_ini_read_real(get_savefile_ini(), "Cutscene", "dougie1", 0)
if !global.dougiecutscene1
{
	scene_info = [[cutscene_do_dialog, [dialog_create("You want the next level?", 3, 0), dialog_create("Yes.", 0, 0), dialog_create("alr", 3, 0)], [0, -4, -4, -4], [3, -4, -4, -4]], [cutscene_waitfor_dialog], [cutscene_set_player_actor], [cutscene_player_clone_create], [cutscene_wait, 20], [function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_222_gml_RoomCC_hub_industrialcomplex_2_Create
	{
		with (recipient)
			image_xscale = 1
		cutscene_end_action()
	}
	], [cutscene_player_float, true], [cutscene_player_pos_approach, 576, 270, 5], [cutscene_wait, 40], [function() 
	{
		with (recipient)
	    {
			if sprite_index == spr_pizzard_shoot
			{
				if floor(image_index) >= 8 && !instance_exists(obj_risinggate)
				{
					with (instance_create(576, 320, obj_risinggate))
			        {
						targetRoom = rm_test
						level = "temple"
						titlecardi = 0
			        }
				}
				if floor(image_index) >= sprite_get_number(sprite_index) - 1
				{
					sprite_index = spr_pizzard_walk
		            with (other)
						cutscene_end_action()
				}
			}
			else
			{
		        sprite_index = spr_pizzard_shoot
				image_index = 0
			}
	    }
	}
	], [function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_480_gml_RoomCC_hub_industrialcomplex_2_Create
	{
	    if !instance_exists(obj_risinggate)
		{
			with (recipient)
				image_xscale = -1
	        cutscene_end_action()
		}
	}
	], [cutscene_wait, 20], [cutscene_player_pos_approach, 320, 270, 5], [cutscene_set_player_pos, 320, 270], [cutscene_do_dialog, [dialog_create("Done", 3, 0, -4, function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_670_gml_RoomCC_hub_industrialcomplex_2_Create
	{
	    global.dougiecutscene1 = true
	    quick_ini_write_real(get_savefile_ini(), "Cutscene", "dougie1", true)
	}
	), dialog_create("How did you do that", 0, 0), dialog_create("Why do you think i'm a fuckin' wizard?", 3, 0)], [0, -4, -4, -4], [3, -4, -4, -4]], [cutscene_waitfor_dialog], [cutscene_player_clone_destroy], [cutscene_player_float, false], [cutscene_set_player_normal]]
}
else
	scene_info = [[cutscene_do_dialog, [dialog_create("I've done all I can do", 3, 0)], [0, -4, -4, -4], [3, -4, -4, -4]]]