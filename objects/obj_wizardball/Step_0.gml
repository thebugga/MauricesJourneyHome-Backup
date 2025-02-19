hsp = (image_xscale * movespeed)
if (blur_effect > 0)
	blur_effect--
else
{
	blur_effect = 2
	with (create_blur_afterimage(x, y, sprite_index, (image_index - 1), image_xscale))
		playerid = other.id
}
if grounded
{
	
	if movespeed > 0
		movespeed -= (global.playerCharacter == Characters.Doise ? 0.5 : 1)
	if global.playerCharacter != Characters.Doise
		vsp = (movespeed / starthsp) * startvsp
}
if (place_meeting((x + image_xscale), y, obj_monstersolid) && (!(place_meeting((x + image_xscale), y, obj_destructibles))) && (!(place_meeting((x + image_xscale), y, obj_monsterslope))))
	image_xscale *= -1
with (instance_place((x + image_xscale), y, obj_destructibles))
{
	if (object_index != obj_onewaybigblock)
		instance_destroy()
	else
	{
		var x1 = other.x
		var y1 = other.y
		var _col = collision_line((x + (35 * image_xscale)), (y + (16 * image_yscale)), x1, y1, obj_solid, false, true)
		if (_col == -4)
			instance_destroy()
		else
			other.image_xscale *= -1
	}
}
if !pointer
{
	with (instance_create(x, y, obj_objecticontracker))
	{
		objectID = other.id
	}
	pointer = true
}
if playerid.state != states.knightpep || y > room_height
	instance_destroy(self, false)