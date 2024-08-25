if global.levelcomplete
{
	global.levelcomplete = false
    if global.levelcompletename == "temple" && !global.templecutscene
	{
		currentroom = room
	    scene_info = [[function() //gml_Script_anon_gml_RoomCC_hub_golf_3_Create_97_gml_RoomCC_hub_golf_3_Create
	    {
	        global.templecutscene = true
	        global.levelcompletename = -4
	        quick_ini_write_real(get_savefile_ini(), "Cutscene", "temple", true)
	        cutscene_end_action()
	    }
	], [cutscene_save_game]]
	}
	else if global.levelcompletename == "retro" && !global.retrocutscene
	{
		currentroom = room
	    scene_info = [[function() //gml_Script_anon_gml_RoomCC_hub_golf_3_Create_97_gml_RoomCC_hub_golf_3_Create
	    {
	        global.retrocutscene = true
	        global.levelcompletename = -4
	        quick_ini_write_real(get_savefile_ini(), "Cutscene", "retro", true)
	        cutscene_end_action()
	    }
	], [cutscene_save_game]]
	}
	else
	    scene_info = [[cutscene_save_game]]
}
else
	scene_info = [[cutscene_wait, 10]]