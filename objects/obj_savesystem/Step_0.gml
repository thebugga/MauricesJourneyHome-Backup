if room == hub_loadingscreen && state != 2
{
	with obj_player
	{
		state = states.comingoutdoor;
		sprite_index = spr_walkfront;
		image_index = 0;
	}
	if !fadeoutcreate
	{
		fadeoutcreate = true;
		var grouparr = ["hubgroup"];
		with obj_parent_player
		{
			ini_open_from_string(obj_savesystem.ini_str);
			var _intro = ini_read_real("Tutorial", "finished", false);
			ini_close();
			scr_characterspr();
			if _intro
			{
				targetRoom = tower_entrancehallway;
				targetDoor = "A";
				state = states.victory;
			}
			/*
			else
			{
				targetRoom = Finalintro;
				targetDoor = "A";
				state = states.titlescreen;
			}
			*/
		}
		with instance_create(x, y, obj_fadeout)
		{
			gamestart = true;
			restarttimer = true;
		}
		icon_alpha = 0;
		with instance_create(0, 0, obj_loadingscreen)
		{
			dark = true;
			group_arr = grouparr;
			offload_arr = ["menugroup", "characterselectgroup"];
		}
	}
}
if state != 0
{
	showicon = true;
	icon_alpha = 3;
}
else if showicon
{
	icon_alpha = approach(icon_alpha, 0, 0.05);
	if icon_alpha <= 0
		showicon = false;
}
if showicon
{
	icon_index += 0.35;
	if icon_index > icon_max - 1
	{
		var t = frac(icon_index);
		icon_index = t;
	}
}
