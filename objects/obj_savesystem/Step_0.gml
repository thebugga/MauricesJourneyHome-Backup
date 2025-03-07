if room == hub_loadingscreen && state != 2
{
	with obj_parent_player
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
			var _texture = ini_read_string("Game", "palettetexture", "none");
			var _texture2 = ini_read_string("Game", "palettetexture_player2", "none");
			ini_close();
		}
		with (instance_create(x, y, obj_fadeout))
		{
			gamestart = true;
			restarttimer = true;
		}
		icon_alpha = 0;
		with (instance_create(0, 0, obj_loadingscreen))
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
	if (icon_index > (icon_max - 1))
	{
		var t = frac(icon_index);
		icon_index = t;
	}
}
