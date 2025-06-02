global.score = max(0, global.score)
shake_mag = max(shake_mag - 0.5, 0)

visible = true

if (string_starts_with(room_get_name(room), "tower") || room == rank_room || room == rm_timesup || instance_exists(obj_titlecard) || room == mainmenu || global.boss_room)
	visible = false
	
var y_goto = ystart
if (obj_player.x > (room_width - 250) && obj_player.y < 180) || !visible
	y_goto = -210
	
y = approach(y, y_goto, 25)
