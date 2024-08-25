event_inherited()
deathspr = spr_pizzard_dead
deathsavename = "dougie"
if (global.wizardcutscene == -4)
	global.wizardcutscene = quick_ini_read_real(get_savefile_ini(), "Cutscene", "wizard", 0)
if (!global.wizardcutscene)
	instance_destroy(self, false)
scene_info = -4
dialog_func = function() //gml_Script_anon_gml_RoomCC_hub_industrialcomplex_2_Create_1097_gml_RoomCC_hub_industrialcomplex_2_Create
{
    do_dialog_cutscene(scene_info)
}