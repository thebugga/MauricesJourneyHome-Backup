var _data = video_draw()
if (_data[0] == 0)
	draw_surface(_data[1], x, y)
else if obj_theaterhandler.alarm[0] <= 0
	obj_theaterhandler.alarm[0] = 1
draw_self()