global.cutscene.bomb = quick_ini_read_real($"saves/saveData{global.savefile}.ini", "Cutscene", "bomb", 0)
if global.cutscene.bomb
{
	dialog_func = function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_1097_gml_RoomCC_hub_industrialcomplex_2_Create
	{
	    with (instance_create(0, 0, obj_cutscenehandler))
	    {
	        recipient = other.id
			scene_info = [[cutscene_do_dialog, [["Oh! Blockade that soon be gotten gone-gone-done when bomb the tows!", 1, 0]], [[0, -4, -4, -4], [1, -4, -4, -4]]], [cutscene_wait, 20], [function() 
			{
			    with (recipient)
			    {
					if sprite_index != spr_player_uppercut
					{
				        sprite_index = spr_player_uppercut
						image_index = 0
					}
					if floor(image_index) >= sprite_get_number(sprite_index) - 1
					{
						sprite_index = spr_playerN_idle
			            with (other)
							scene++
					}
			    }
			}
			], [cutscene_wait, 30], [cutscene_move_player, 1688, 1], [function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_480_gml_RoomCC_hub_industrialcomplex_2_Create
			{
			    //if (!instance_exists(obj_pizzagoblinbomb))
				//{
					with (obj_cutscenepillar)
						instance_destroy()
			        scene++
				//}
			}
			], [cutscene_wait, 50], [cutscene_do_dialog, [["Ecstatic! You see around I will soon.", 1, 0, -4, function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_670_gml_RoomCC_hub_industrialcomplex_2_Create
			{
			    global.cutscene.doise1 = true
			    quick_ini_write_real($"saves/saveData{global.savefile}.ini", "Cutscene", "doise1", true)
			}
			]], [[0, -4, -4, -4], [1, -4, -4, -4]]], [cutscene_set_player_state, states.actor], [function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_874_gml_RoomCC_hub_industrialcomplex_2_Create
			{
			    with (recipient)
			    {
			        sprite_index = spr_player_move
					x += 10
			        if (x >= room_width + 50)
			        {
			            instance_destroy(self, false)
			            with (other)
			                scene++
			        }
			    }
			}
			], [cutscene_set_player_state, states.normal]]
	    }
	}
}
else
{
	dialog[0] = ["This that pillar the on way, prevent myself needed to have through. Help!", 1, 0]
	dialogsidel = [0, -4, -4, -4]
	dialogsider = [1, -4, -4, -4]
}
global.cutscene.doise1 = quick_ini_read_real($"saves/saveData{global.savefile}.ini", "Cutscene", "doise1", 0)
if (global.cutscene.doise1)
	instance_destroy(self, false)
if obj_player.character == p_characters.undoised
	instance_destroy(self, false)