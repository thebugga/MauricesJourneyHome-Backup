image_speed = 0.5
alarm[1] = 300
depth = -8
var mins = global.level_minutes
if (mins < 10)
	mins = concat("0", mins)
else
	mins = concat(mins)
var secs = floor(global.level_seconds)
if (secs < 10)
	secs = concat("0", secs)
else
	secs = concat(secs)
minitext = [
	[false, concat("HIGHEST COMBO: ", global.highest_combo)],
	[false, concat("DAMAGE: ", global.player_damage)],
	[false, concat("TIME: ", mins, ":", secs, ".", floor(frac(global.level_seconds) * 100))]
]
minitext_pos = 0
bg_x = 0
bg_y = 0
bg_alpha = 0