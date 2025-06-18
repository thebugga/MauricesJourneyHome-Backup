image_xscale = playerid.image_xscale
x = playerid.x + (offsetx * image_xscale)
y = playerid.y + offsety
if lifetime > 0
	lifetime--
else
	instance_destroy()