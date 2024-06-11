var playerid = obj_player
if (image_alpha >= 1)
{
	var dir = point_direction(x, y, playerid.x, playerid.y);
	x += lengthdir_x(maxspeed, dir)
	y += lengthdir_y(maxspeed, dir)
}
else
	image_alpha += 0.01;