hsp = approach(hsp, 0, 0.25)
vsp = approach(vsp, 0, 0.25)
if !pointer
{
	with (instance_create(x, y, obj_objecticontracker))
		objectID = other.id
	pointer = true
}
if (playerid.state != states.knightpep && playerid.state != states.knightpepslopes) || y > room_height
	instance_destroy(self, false)