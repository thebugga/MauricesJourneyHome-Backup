image_xscale = playerid.Xscale
if (playerid.state != states.rocket && playerid.state != states.mach3 && playerid.state != states.crouchslide && playerid.state != states.shoulderbash)
	instance_destroy()
x = playerid.x
y = playerid.y
if (playerid.state == states.rocket)
	x = (playerid.x + (playerid.Xscale * 18))
visible = (!(room == rank_room))
if (place_meeting(x, y, obj_secretportal) or place_meeting(x, y, obj_secretportalstart))
	visible = false
