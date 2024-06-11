
function sh_switch_char(args)
{
	with (obj_player)
	{
		if (character == "M"){
		character = "D"
		scr_characterspr();
		}
		if (character == "D"){
		character = "M"
		scr_characterspr();
		}
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
