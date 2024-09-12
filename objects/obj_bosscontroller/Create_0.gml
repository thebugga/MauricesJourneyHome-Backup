depth = (obj_drawcontroller.depth + 2)
function get_player_hp()
{
	
}

player_hpmultiplier = 300
player_hpbase = (player_hpmultiplier * 5)
player_hpmax = player_hpbase
player_hp = player_hpmax

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
state = states.arenaintro
fade = 1
fakedeath = 0

extrarounds = 0
extrarounds_count = 3
startroundfunc = -4
endroundfunc = -4

supermax = 3000
super = 0

vstitle = spr_vstitle
playerspr = spr_vspeppino
playersprshadow = spr_vspeppinoshadow
bossspr = spr_vsnoise
bosssprshadow = spr_vsnoiseshadow
intro_buffer = 300
playerx = -sprite_get_width(playerspr)
bossx = 960 + sprite_get_width(bossspr)
vsy = -400
flamey = 0
flash = 0
flashed = 0

round_ystart = 641
round_y = round_ystart
round_xstart = 480
round_x = round_xstart
bosstimer_x = 257
bosstimer_y = 36

bell_sprite = spr_bosstimer_bell
bell_index = 0
bell_buffer = 0
bar_surface = -4
barfill_x = 0
bg_super_y = 0

super_portrait_xstart = 201
super_portrait_y = 300
super_portrait_x_off = -190
super_portrait_x = super_portrait_x_off
super_portrait_state = 0
super_portrait_index = 0

portrait1_index = 0
portrait2_index = 1
