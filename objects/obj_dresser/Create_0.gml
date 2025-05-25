clothes_arr = [	
	new make_clothes_inst("Basic Bitch",	"The one and only.",									1),
	new make_clothes_inst("Steamin' Mad",	"Looks like my lover...",								2),	
	new make_clothes_inst("the G.O.A.T.",	"Without him, the Noise wouldn't be here right now.",	3),	
	new make_clothes_inst("Perculiar Pinks",		"You could even say... Pretty.",				4),	
	new make_clothes_inst("Shadowy Figure",		"Did you bring a light?",							5),	
	new make_clothes_inst("Somewhat Blue",		"Not really Nostalgia bait.",						6),	
	new make_clothes_inst("Green Guy",		"Does he even go outside?",								7),
	new make_clothes_inst("Pizza Man",		"BECOME THE PIZZA!",									8, pat_pizza),
]

clothes_selected = 0

switch obj_player.pal_select
{
	case 0:
	case 1:
			clothes_selected = 0  break;
	case 2: clothes_selected = 1 break;
	case 3: clothes_selected = 2 break;
	case 4: clothes_selected = 3 break;
	case 5: clothes_selected = 4 break;
	case 6: clothes_selected = 5 break;
	case 7: clothes_selected = 6 break;
	case 8: 
		switch obj_player.pattern_spr
		{
			case pat_pizza: clothes_selected = 7 break;
		}
		break;
}
//hopefully theres a better way to map these

alph = 0

function make_clothes_inst(_name, _desc, _pal_ix, _pattern = noone) constructor
{
	name = _name
	description = _desc
	pal_ix = _pal_ix
	pattern = _pattern
}