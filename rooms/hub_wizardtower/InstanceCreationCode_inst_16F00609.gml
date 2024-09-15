if global.levelcomplete
{
	global.levelcomplete = false
    if !global.wizardcutscene
	{
		currentroom = room
	    scene_info = [[function() //gml_Script_anon_gml_RoomCC_hub_golf_3_Create_97_gml_RoomCC_hub_golf_3_Create
	    {
	        global.wizardcutscene = true
	        global.levelcompletename = -4
	        quick_ini_write_real(get_savefile_ini(), "Cutscene", "wizard", true)
	        cutscene_end_action()
	    }
	], [cutscene_save_game]]
	}
	else
	    scene_info = [[cutscene_save_game]]
}
else
	scene_info = [[cutscene_wait, 10]]