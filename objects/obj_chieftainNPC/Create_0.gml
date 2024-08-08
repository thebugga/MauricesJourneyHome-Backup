event_inherited()
dialog[0] = dialog_create("...", 2, 0)
dialog[1] = dialog_create("THE FUCKING KEY, NOW!", 0, 0, "angershake")
dialog[2] = dialog_create("...", 2, 0, -4, function()
{
	global.elevatorcutscene1 = true
	quick_ini_write_real(get_savefile_ini(), "Cutscene", "elevator1", true)
	exit;
}
)
dialog[3] = dialog_create("GOAWGH", 1, 0)
dialogsidel = [1, 0, -4, -4]
dialogsider = [-4, 2, -4, -4]