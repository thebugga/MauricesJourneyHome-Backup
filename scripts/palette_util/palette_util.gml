function get_pep_palette_info()
{
	if global.swapmode
	{
		var pal = 1;
		return 
		{
			spr_palette: spr_peppalette,
			paletteselect: obj_player1.player_paletteselect[pal],
			patterntexture: obj_player1.player_patterntexture[pal]
		};
	}
	else if obj_savesystem.character == "P"
	{
		return 
		{
			spr_palette: obj_player1.spr_palette,
			paletteselect: obj_player1.paletteselect,
			patterntexture: global.palettetexture
		};
	}
	return 
	{
		spr_palette: spr_peppalette,
		paletteselect: 1,
		patterntexture: noone
	};
}
function get_noise_palette_info()
{
	if global.swapmode
	{
		var pal = 0;
		return 
		{
			spr_palette: spr_noisepalette,
			paletteselect: obj_player1.player_paletteselect[pal],
			patterntexture: obj_player1.player_patterntexture[pal]
		};
	}
	else if obj_savesystem.character == "N"
	{
		return 
		{
			spr_palette: obj_player1.spr_palette,
			paletteselect: obj_player1.paletteselect,
			patterntexture: global.palettetexture
		};
	}
	return 
	{
		spr_palette: spr_noisepalette,
		paletteselect: 1,
		patterntexture: noone
	};
}
function get_custom_palette_info()
{
	if global.swapmode
	{
		var pal = 0;
		return 
		{
			spr_palette: obj_player1.spr_palette,
			paletteselect: obj_player1.player_paletteselect[pal],
			patterntexture: obj_player1.player_patterntexture[pal]
		};
	}
	else if obj_savesystem.character != "P" && obj_savesystem.character != "N"
	{
		return 
		{
			spr_palette: obj_player1.spr_palette,
			paletteselect: obj_player1.paletteselect,
			patterntexture: global.palettetexture
		};
	}
	return 
	{
		spr_palette: (other.object_index == obj_swapmodefollow || other.object_index == obj_parent_player ? other.spr_palette : spr_peppalette),
		paletteselect: 1,
		patterntexture: noone
	};
}