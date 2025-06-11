if !instance_exists(target)
	exit
if target.secret_exit
	exit

campos = {
	x: target.x - (screen_w / 2),
	y: target.y - (screen_h / 2) - 20,
}

if target.state == states.backtohub
{
	campos.y = target.ystart - (screen_h / 2) - 20
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
