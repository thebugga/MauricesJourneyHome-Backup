sprite_index = spr_playerN_idle
deathspr = spr_playerN_hurt
deathsavename = "undoised"
dialog[0] = dialog_create("This that ice the on way, prevent myself needed to have through. Again help!", 1, 0)
dialogsidel = [0, -4, -4, -4]
dialogsider = [1, -4, -4, -4]
if global.swapmode && (global.playerCharacter == Characters.Doise || global.playerFollowCharacter == Characters.Doise)
	instance_destroy(self, false)