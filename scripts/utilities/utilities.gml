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

function scr_get_texture_array()
{
	return [
		["test", spr_font],
	];
}

function scr_get_texture_palette(texture)
{
	var _arr = scr_get_texture_array();
	if texture != "none"
	{
		for (var i = 0; i < array_length(_arr); i++)
		{
			if _arr[i][0] == texture
				return _arr[i][1];
		}
	}
	return noone;
}

function scr_palette_texture(sprite, subimg, x, y, xscale, yscale, rot = 0, col = c_white, alpha = 1, gui = false, texture = noone)
{
	if texture == noone
		texture = global.palettetexture;
	if texture == noone
		exit;
	
	if event_type == ev_draw && event_number == ev_gui
		gui = true;
	else
		gui = false;
	
	if shader_current() == global.Pal_Shader
		pal_swap_set(spr_mauricepalette, 1, false);
	
	if !surface_exists(global.palettesurface)
		global.palettesurface = surface_create(960, 540);
	if !surface_exists(global.palettesurfaceclip)
		global.palettesurfaceclip = surface_create(960, 540);
	
	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);
	if gui
	{
		cx = 0;
		cy = 0;
	}
	
	surface_set_target(global.palettesurfaceclip);
	draw_clear_alpha(0, 0);
	draw_rectangle_color(0, 0, 960, 540, c_white, c_white, c_white, c_white, false);
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sprite, subimg, x - cx, y - cy, xscale, yscale, rot, c_white, 1);
	if gui
		reset_blendmode();
	else
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
	surface_set_target(global.palettesurface);
	var sw = sprite_get_width(sprite);
	var sh = sprite_get_height(sprite);
	var xs = sw / sprite_get_width(texture);
	var ys = sh / sprite_get_height(texture);
	var xo = sprite_get_xoffset(sprite);
	var yo = sprite_get_yoffset(sprite);
	var xx = x - cx - xo;
	var yy = y - cy - yo;
	
	if xscale < 0
		xx = ((x - cx) + xo) - sw;
	if yscale < 0
		yy = ((y - cy) + yo) - sh;
	
	draw_sprite_ext(texture, 0, xx, yy, xs + 4, ys + 4, 0, col, 1);
	gpu_set_blendmode(bm_subtract);
	draw_surface(global.palettesurfaceclip, 0, 0);
	if gui
		reset_blendmode();
	else
		gpu_set_blendmode(bm_normal);
	surface_reset_target();
	draw_surface_ext(global.palettesurface, cx, cy, 1, 1, 0, c_white, alpha);
}


function get_save_folder()
{
	return "saves";
}