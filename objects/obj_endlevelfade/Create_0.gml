fadealpha = 0
fadein = 0
alarm[1] = 200
receiptonscreen = false
receiptx = 960
text = [
	[false, concat("Goochling Pieces x ", global.toppintotal), global.toppintotal * 0.25],
	[false, "Secret Goochling Piece", global.goochlinggot[4]],
	[false, concat("Secrets x ", global.secretfound), global.secretfound * 0.75],
	[false, "Treasure", global.treasure * 3],
	[false, "Tax", 0.65],
	[false, "Total", (global.toppintotal * 0.25) + global.goochlinggot[4] + (global.secretfound * 1.25) + (global.treasure * 3) + 0.65]
]
text_pos = 0
approachscore = global.collect
if global.coop
	approachscore += global.collectN
slowscore = 0
showrank = true
prevrank = 0
do_rank = 0;
rank = 0
rankscale = 2