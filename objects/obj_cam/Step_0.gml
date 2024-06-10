if (instance_exists(obj_player))
{
    var target = obj_player;
	var view = view_camera[0];
	var cam_width = camera_get_view_width(view);
	var cam_height = camera_get_view_height(view);
	cam_x = clamp(target.x - (cam_width / 2), 0, room_width - cam_width);
	cam_y = clamp(target.y - (cam_height / 2), 0, room_height - cam_height);
	camera_set_view_pos(view, cam_x + charge_camera, cam_y);
}