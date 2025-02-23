global.levelcomplete = 1
global.levelcompletename = global.leveltosave
scr_playerreset()
with (obj_parent_player)
{
	targetRoom = rm_levelselect
	room = rm_levelselect
	x = -100
	y = -100
	state = states.titlescreen
	image_blend = c_white
}
global.level_minutes = 0
global.level_seconds = 0