dialog[0] = ["Why Hello there little green guy, welcome to the Pizza Tower, 2! Would you like to book a stay?", 2, 0]
dialog[1] = ["SHUT THE FUCK UP!!!", 0, 0, "angershake"]
dialog[2] = ["......:(", 2, 0]
dialog[3] = ["Gimme a fuckass room key right now!", 0, 0, "angershake", function()
{
	global.cutscene.elevator1 = true
	quick_ini_write_real($"saves/saveData{global.savefile}.ini", "Cutscene", "elevator1", true)
}]
dialog[4] = ["ok man... not cool...", 2, 0]
dialogsidel = [0, -4, -4, -4]
dialogsider = [2, -4, -4, -4]