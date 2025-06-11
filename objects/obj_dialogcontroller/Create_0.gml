padding = 16
rpadding = 20
savedstate = (0 << 0)
dialog = -4
currentdialog = 0
displaytext = ""
currentpos = 0
textbuffer = 0
textspeed = 1
textheight = 0
dialogsprite = mask_player
talk_sprites[0][0] = {
	idle: spr_dialogue_mauricenormal,
	talk: spr_dialogue_mauricenormaltalk,
	idleblink: spr_dialogue_mauricenormalblink,
	talkblink: spr_dialogue_mauricenormaltalkblink
	}
talk_sprites[1][0] = {
	idle: spr_dialogue_undoisednormal,
	talk: spr_dialogue_undoisednormaltalk,
	idleblink: -4,
	talkblink: -4
	}
talk_sprites[2][0] = {
	idle: spr_dialogue_colyisia, 
	talk: -4, 
	idleblink: -4, 
	talkblink: -4
	}
talk_sprites[3][0] = {
	idle: spr_dialogue_mauricedayoff,
	talk: -4,
	idleblink: -4,
	talkblink: -4
	}
talk_sprites[4][0] = {
	idle: spr_tenna_dance_cabbage_big,
	talk: -4,
	idleblink: -4,
	talkblink: -4
	}
dialogchars = [[-4, -4, -4, -4], [-4, -4, -4, -4]]

surf = -4
clip = -4
effect_shake = 0
npcID = -4
pattern_init()
