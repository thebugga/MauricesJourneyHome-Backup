function scr_ghostcollectible(pizzasona = false)
{
	var q = -4
	var b = id
	with (obj_ghostcollectibles)
	{
		q = 
		{
			x: b.xstart,
			y: b.ystart,
			sprite_index: b.sprite_index,
			image_speed: b.image_speed,
			image_number: b.image_number,
			image_alpha: 0.5,
			image_index: 0,
			pizzasona: pizzasona
		}
		trace(q)
		ds_list_add(collectiblelist, q)
	}
	return q;
}

function scr_tvtopmessage(_message = "")
{
	var q = -4
	with (obj_tv)
	{
		q = 
		{
			text: _message,
			timer: 500,
			alpha: 1
		}
		trace(q)
		ds_list_add(messagelist, q)
	}
	return q;
}
