
function sh_switch_char(args)
{
	with (obj_player)
	{
		character = "D"
		scr_characterspr();
	}
}

function meta_switch_char()
{
	return 
	{
		description: "Switches character",
		arguments: [],
		suggestions: [],
		argumentDescriptions: []
	};
}

function sh_noclip(args)
{
	with (obj_player)
		state = (state == states.debugstate ? state = states.normal : states.debugstate);
}

function meta_noclip()
{
	return 
	{
		description: "Toggles noclip",
		arguments: [],
		suggestions: [],
		argumentDescriptions: []
	};
}


function sh_panic(args)
{
	global.panic = true
}

function meta_panic()
{
	return 
	{
		description: "Toggles Tubular Pizza Hour",
		arguments: ["<bool>", "<minutes>", "<seconds>"],
		suggestions: [],
		argumentDescriptions: []
	};
}

function sh_player_room(args)
{
	var _room = args[1]
	var _door = args[2]
	if _room == undefined
		return "No room defined";
	if _door == undefined
		_door = "A";
	_room = asset_get_index(_room);
	if _room == -1
		return "Room does not exist";
	with (obj_player)
	{
		target_room = _room;
		target_door = _door;
	}
	instance_create(x, y, obj_fadeout);
	return "Attempting to go to room " + room_get_name(_room) + " at door " + _door;
}

function meta_player_room()
{
	var i = 0;
	var pizza = [];
	while room_exists(i)
	{
		array_push(pizza, room_get_name(i));
		i++;
	}
	return 
	{
		description: "Go to given room",
		arguments: ["<targetRoom>", "<targetDoor:A>"],
		suggestions: pizza,
		argumentDescriptions: []
	};
}
