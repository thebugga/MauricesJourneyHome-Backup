dialog[0] = dialog_create("They Should Add Sex To The Game", 1, 0)
dialogsidel = [0, -4, -4, -4]
dialogsider = [1, -4, -4, -4]
if global.swapmode && (global.playerCharacter == Characters.Doise || global.playerFollowCharacter == Characters.Doise)
	instance_destroy(self, false)