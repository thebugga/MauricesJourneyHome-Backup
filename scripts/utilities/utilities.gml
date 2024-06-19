//whuh?_call
exception_unhandled_handler(function(ex)
{
    // Print some messages to the output log
    show_debug_message( "------------------------------------------------------------------");
    show_debug_message( " Unhandled exception " + string(ex) );
    show_debug_message( "------------------------------------------------------------------");

    // Write the exception struct to a file
    if file_exists("crash.txt") file_delete("crash.txt");
    var _f = file_text_open_write("crash.txt");
    file_text_write_string(_f, string(ex));
    file_text_close(_f);

    // Show the error message (for debug purposes only)
    show_message(ex.longMessage);

    return 0;
}); 
function draw_reset() {
	draw_set_alpha(1)
	draw_set_color(c_white)
}
function concat()
{
	var _string = "";
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i]);
	return _string;
}
function instance_create(x, y, obj) 
{
	return instance_create_depth(x, y, -1, obj)
}
function set_spr(sprite) {
	if !is_string(sprite)
		sprite_index = sprite
	else 
		show_error("Sprite argument is not asset", false)
}

function setxy(xp, yp) {
		x = xp
		y = yp
}

function draw_tip(argument0) {
	instance_destroy(obj_transfotip)
    var b = -4
    with (instance_create(0, 0, obj_transfotip))
    {
        event_user(1)
        b = id
    }
}

#macro img_ind floor(image_index)

function trace()
{
	var _string = "";
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i]);
	show_debug_message(_string);
}
function bbox_in_camera(camera, threshold = 0)
{
	var cam_x = camera_get_view_x(camera);
	var cam_y = camera_get_view_y(camera);
	var cam_w = camera_get_view_width(camera);
	var cam_h = camera_get_view_height(camera);
	return bbox_left < (cam_x + cam_w + threshold) && bbox_right > (cam_x - threshold) && bbox_top < (cam_y + cam_h + threshold) && bbox_bottom > (cam_y - threshold);
}
function Approach(a, b, amount)
{
	// source: https://www.youtube.com/watch?v=2FroAhEsuE8
	if a < b
	{
		a += amount;
		if a > b
			return b;
	}
	else
	{
		a -= amount;
		if a < b
			return b;
	}
	return a;
}