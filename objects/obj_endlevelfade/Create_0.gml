fadealpha = 0
fadein = 0
obj_endlevelfade.alarm[1] = 200
receiptonscreen = false
receiptx = 960
text = [
	[false, concat("Toppins x ", global.toppintotal), global.toppintotal * 0.5],
	[false, concat("Secrets x ", global.secretfound), global.secretfound * 1.25],
	[false, "Treasure", global.treasure * 5],
	[false, "Tax", 0.65],
	[false, "Total", (global.toppintotal * 0.5) + (global.secretfound * 1.25) + (global.treasure * 5) + 0.65]
]
text_pos = 0
approachscore = global.collect
if global.coop
	approachscore += global.collectN
slowscore = 0
showrank = true
prevrank = 0
rank = 0
rankscale = 2