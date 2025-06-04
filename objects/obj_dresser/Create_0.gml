pattern_init()
up = false
playerid = -4
h_select = [0, 0, 0]
v_select = 0
v_selectnames = ["Clothes", "Hats", "some other 3rd thing"]

clothes_arr = [	
	new make_clothes_inst("Basic Bitch",				"The one and only.",									1),
	new make_clothes_inst("Mau-Red",					"Mean Ass Maurice! A Maurice with Red on?",				2),	
	new make_clothes_inst("Somewhat Blue",				"Not really Nostalgia bait.",							3),	
	new make_clothes_inst("Poo-Rice",					"Shitty!",												4),	
	new make_clothes_inst("I am Mr. Stick",				"This is my Mr. Stick Song",							5),	
	new make_clothes_inst("Shadowy Figure",				"Did you bring a light?",								6),
	new make_clothes_inst("Chef's Fit",					"I hate him.",											7),
	new make_clothes_inst("Steamin' Mad",				"What time is it?",										8),
	new make_clothes_inst("This is the color, Purple",  "YO SHIT FOR BRAINS, WHAT GODDAMN COLOR IS THIS, HUH!?",9),
	new make_clothes_inst("Teal",						"Why so Teal?",											10),
	new make_clothes_inst("Perculiar Pinks",			"You could even say... Pretty.",						11),
	new make_clothes_inst("Limited",					"You know what they say...",							12),
	new make_clothes_inst("Rainbows",					"-kay people tomorrow morning,-",						13, pat_rainbow),
	new make_clothes_inst("the G.O.A.T.-mer",			"Gomer!",												13, pat_gomer),
]
hats_arr = [["Nothing", -4], ["the Yankees", spr_hat_mets], ["Doom", spr_hat_doom]]
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
