depth = -7
enum BCstates
{
	arenaintro,
	arenaround,
	normal,
	transitioncutscene,
	victory,
	gameover,
}

intro_buffer = 300
maxminutes = 0
maxseconds = 45
round_count = 1
round_max = 6
timer_max = (room_speed * 3)
timer_buffer = timer_max
round_timermax = 2700
round_timer = round_timermax
minutes = maxminutes
seconds = maxseconds
use_countdown = 1

bossID = -4
state = BCstates.arenaintro
fade = 1
fakedeath = 0

flash = 0
flashed = 0

round_ystart = 641
round_y = round_ystart
round_xstart = 480
round_x = round_xstart
bosstimer_x = 257
bosstimer_y = 36

bg_super_y = 0

super_portrait_xstart = 201
super_portrait_y = 300
super_portrait_x_off = -190
super_portrait_x = super_portrait_x_off
super_portrait_state = 0
super_portrait_index = 0

obj_camera.heirarchy = self.object_index