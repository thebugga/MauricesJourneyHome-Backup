if !instance_exists(target)
	exit

var xx = 0
var yy = 0

if heirarchy == obj_player
{
	if target.secret_exit
		exit
	
	xx = target.x
	yy = target.y
	if target.state == states.backtohub
		yy = target.ystart
}
else if heirarchy == obj_bosscontroller
{
	var playcount = 0
	with obj_bossplayer
	{
		xx += x
		yy += y
		playcount++
	}
}

campos = {
	x: xx - (screen_w / 2),
	y: yy - (screen_h / 2) - 20,
}

campos.x += cam_charge

campos.x = clamp(campos.x, 0, room_width - screen_w)
campos.y = clamp(campos.y, 0, room_height - screen_h)

if mag > 0
{
	campos.x += random_range(mag, -mag)
	campos.y += random_range(mag, -mag)
}


camera_set_view_pos(view_camera[0], campos.x, campos.y)
