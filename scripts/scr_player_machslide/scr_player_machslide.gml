function scr_player_machslide()
{
	if (!(place_meeting(x, (y + 1), obj_railparent)))
		hsp = (Xscale * Movespeed)
	else
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		hsp = ((Xscale * Movespeed) + (_railinst.Movespeed * _railinst.dir))
	}
	Move = (key_right + key_left)
	if (Movespeed >= 0)
		Movespeed -= 0.4
	if (sprite_index == spr_machslidestart && floor(image_index) == (image_number - 1))
		sprite_index = spr_machslide
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_machslideboost || sprite_index == spr_mach3boost))
	{
		if (!grounded)
		{
			if (sprite_index == spr_machslideboost)
				sprite_index = spr_player_machslideboostfall;
			else if (sprite_index == spr_mach3boost)
				sprite_index = spr_player_mach3boostfall;
		}
		else
			image_index = image_number - 1;
	}
	else
		image_speed = 0.35;
	landAnim = 0
	if (floor(Movespeed) <= 0 && (sprite_index == spr_machslide or sprite_index == spr_crouchslide))
	{
		state = states.normal
		image_index = 0
		if (sprite_index == spr_machslide)
			machslideAnim = 1
		Movespeed = 0
	}
	if (place_meeting((x + Xscale), y, obj_solid) && (sprite_index == spr_machslide or sprite_index == spr_machslidestart))
	{
		sprite_index = spr_player_wallsplat
		state = states.bump
		image_index = 0
		//scr_soundeffectpitched(sfx_splat)
	}
	if (((floor(image_index) == (image_number - 1) && sprite_index == spr_machslideboost) || sprite_index == spr_player_machslideboostfall) && grounded)
	{
		hsp = 0
		image_index = 0
		Xscale *= -1
		Movespeed = 8
		state = states.mach2
	}
	if (((floor(image_index) == (image_number - 1) && sprite_index == spr_mach3boost) || sprite_index == spr_player_mach3boostfall) && grounded)
	{
		if (!launch)
		{
			hsp = 0
			sprite_index = spr_mach4
			image_index = 0
			Xscale *= -1
			Movespeed = 12
			state = states.mach3
		}
		else
		{
			Xscale *= -1
			sprite_index = spr_dashpadmach
			image_index = 0
			state = states.mach3
			Movespeed = 14
			launched = 1
			launch = 0
			launch_buffer = 20
		}
	}
	if (sprite_index == spr_player_crouchslide && Movespeed == 0 && grounded)
	{
		facehurt = 1
		state = states.normal
		sprite_index = spr_facehurtup
	}
	if ((!instance_exists(dashcloudid)) && grounded && (!(place_meeting(x, (y + 1), obj_water))))
	{
		with (instance_create(x, y, obj_dashcloud2))
		{
			image_xscale = other.Xscale
			other.dashcloudid = id
		}
	}
	if ((!instance_exists(dashcloudid)) && grounded && place_meeting(x, (y + 1), obj_water))
	{
		with (instance_create(x, y, obj_dashcloud2))
		{
			sprite_index = spr_watereffect
			image_xscale = other.Xscale
			other.dashcloudid = id
		}
	}
	exit;
}

