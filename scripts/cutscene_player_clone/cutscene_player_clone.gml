function cutscene_player_clone_create()
{
	playerclone = instance_create(obj_player1.x, obj_player1.y, obj_actor)
	with (obj_player1)
	{
		visible = false
		with (other.playerclone)
		{
			use_palette = 1
			spr_palette = other.spr_palette
			paletteselect = other.paletteselect
			depth = other.depth
			image_speed = 0.35
			image_xscale = other.Xscale
			sprite_index = other.spr_idle
			visible = true
		}
	}
	cutscene_end_action()
	exit;
}

function cutscene_player_clone_destroy()
{
	with (playerclone)
	{
		obj_player1.visible = true
		obj_player1.x = x
		obj_player1.y = y
		instance_destroy()
	}
	cutscene_end_action()
	exit;
}
