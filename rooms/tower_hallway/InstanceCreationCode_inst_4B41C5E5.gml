dialog[0] = ["{w}Why Hello there little green guy, welcome to the Pizza Tower, {s}2!{w} Would you like to book a stay?", 2, 0]
dialog[1] = ["{s}SHUT THE FUCK UP!!!", 0, 0, "angershake"]
dialog[2] = ["......:(", 2, 0]
dialog[3] = ["{s}Gimme a fuckass room key right now!", 0, 0, "angershake", function()
{
	global.cutscene.elevator1 = true
	quick_ini_write_real($"saves/saveData{global.savefile}.ini", "Cutscene", "elevator1", true)
}]
dialog[4] = ["ok man... [t]not cool...", 2, 0]
dialogchars = [[0, -4, -4, -4], [2, -4, -4, -4]]