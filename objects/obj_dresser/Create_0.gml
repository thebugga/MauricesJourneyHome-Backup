pattern_init()
up = false
playerid = -4
h_select = [0, 0, 0]
v_select = 0
v_selectnames = ["Clothes", "Hats", "some other 3rd thing"]

clothes_arr = [	
	new make_clothes_inst("Basic Bitch",	"The one and only.",									1),
	new make_clothes_inst("Steamin' Mad",	"Looks like my lover...",								2),	
	new make_clothes_inst("the G.O.A.T.",	"Without him, the Noise wouldn't be here right now.",	3),	
	new make_clothes_inst("Perculiar Pinks",		"You could even say... Pretty.",				4),	
	new make_clothes_inst("Shadowy Figure",		"Did you bring a light?",							5),	
	new make_clothes_inst("Somewhat Blue",		"Not really Nostalgia bait.",						6),	
	new make_clothes_inst("Green Guy",		"Does he even go outside?",								7),
	new make_clothes_inst("Green Guy",		"Does he even go outside?",								8),
	new make_clothes_inst("Green Guy",		"Does he even go outside?",								9),
	new make_clothes_inst("Green Guy",		"Does he even go outside?",								10),
	new make_clothes_inst("Green Guy",		"Does he even go outside?",								11),
]
hats_arr = [["Nothing", -4], ["the Yankees", spr_hat_mets], ["Crunchy Construction", spr_hat_ss]]
walk_sprite = -4
walk_index = 0
taunt_index = 0
bg_place = 0
alpha = 0

function make_clothes_inst(_name, _desc, _pal_ix, _pattern = noone) constructor
{
	name = _name
	description = _desc
	pal_ix = _pal_ix
	pattern = _pattern
}
