state = 0
white_fade_alpha = 0
alarm[2] = 200
alarm[0] = 240
image_index = image_number - 1
image_speed = 0
depth = -8
rank_scorefinal = 0
rank_score = 0

showrank = true
prevrank = 0
do_rank = 0
rankscale = 2
rank_ix = 0

rank_data = [
	{sprite: spr_rankD, song: mu_rankd},
	{sprite: spr_rankC, song: mu_rankc},
	{sprite: spr_rankB, song: mu_rankb},
	{sprite: spr_rankA, song: mu_ranka},
	{sprite: spr_rankS, song: mu_ranks},
	{sprite: spr_rankP, song: mu_rankp}
]

receiptonscreen = false
receiptx = 960

text_pos = 0

var nowgooch = 0
for (var i = 0; i < 4; i++)
	nowgooch += global.level_data.goochlings[i]
			
texters = [
	[false, concat("Goochling Pieces x ", nowgooch), nowgooch * 0.25],
	[false, "Secret Goochling Piece", global.level_data.goochlings[4]],
	[false, concat("Secrets x ", global.level_data.secret_count), global.level_data.secret_count * 0.75],
	[false, "Treasure", global.level_data.treasure * 3],
	[false, "Tax", 0.65],
	[false, "Total", (nowgooch * 0.25) + global.level_data.goochlings[4] + (global.level_data.secret_count * 0.75) + (global.level_data.treasure * 3) + 0.65]
]

var x_start = screen_w - 437
var offset = 89

toppin_ix = 0

results = [
	["HIGHSCORE: ", 0, false],
	["TIME: ", 0, false],
	["DAMAGE: ", 0, false],
	["HIGHEST COMBO: ", 0, false]
]

minitext_pos = 0
bg_x = 0
bg_y = 0
bg_alpha = 0

result_ix = 0

pattern_init()
