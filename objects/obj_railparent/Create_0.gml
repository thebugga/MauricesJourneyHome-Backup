alarm[0] = 1;
maxMovespeed = 3;
Movespeed = maxMovespeed;
dir = 1;
depth = 50;
spr_left = -4;
spr_right = -4;
objectlist = [obj_dashpad, obj_movingspike, obj_pinballlauncher]
use_left = true;
use_right = true;
draw = true;
if (place_meeting(x + 1, y, obj_solid))
	use_right = false;
if (place_meeting(x - 1, y, obj_solid))
	use_left = false;
surf = noone;
