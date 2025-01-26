global.levelcomplete = 1
global.levelcompletename = global.leveltosave
scr_playerreset()
with (obj_parent_player)
{
	targetRoom = backtohubroom
	room = backtohubroom
	x = backtohubstartx
	y = backtohubstarty
	state = states.comingoutdoor
	image_blend = c_white
}
global.level_minutes = 0
global.level_seconds = 0