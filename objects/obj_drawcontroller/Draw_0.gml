draw_set_color(c_black);
draw_set_color(c_white);
draw_set_color(c_white);
if use_dark
{
	for (var i = 0; i < array_length(dark_arr); i++)
	{
		with dark_arr[i]
		{
			if visible
			{
				var b = get_dark(image_blend, other.use_dark);
				{
					var blend = image_blend;
					image_blend = b;
					event_perform(ev_draw, 0);
					image_blend = blend;
				}
			}
		}
	}
}
else if finisher_alpha > 0
	finisher_alpha = Approach(finisher_alpha, 0, 0.02);
if finisher_alpha > 0
{
	draw_set_alpha(finisher_alpha);
	draw_rectangle_color(-32, -32, room_width + 32, room_height + 32, 0, 0, 0, 0, false);
	draw_set_alpha(1);
}
var _kungfu = global.kungfu;
shader_set(global.Pal_Shader);
with obj_baddie
{
		draw_enemy(_kungfu, true);
}
for (i = 0; i < array_length(flash_arr); i++)
{
	with flash_arr[i]
	{
		if visible && flash
			event_perform(8, 0);
	}
}
shader_set(global.Pal_Shader);
pal_swap_set(spr_mauricepalette, 0);
with obj_pizzagoblinbomb
{
	if grabbable && grounded && vsp > 0
		draw_sprite(spr_grabicon, -1, x - 10, y - 30);
	draw_self();
}
with obj_player
{
	if (visible && state != states.titlescreen && bbox_in_camera(view_camera[0], 32))
		draw_player();
        shader_set(global.Pal_Shader);
}
with obj_player
{
	if (visible && flash && bbox_in_camera(view_camera[0], 32))
		draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
}
with obj_player2
{
	if (visible && state != states.titlescreen && bbox_in_camera(view_camera[0], 32))
		draw_player();
        shader_set(global.Pal_Shader);
}
with obj_player2
{
	if (visible && flash && bbox_in_camera(view_camera[0], 32))
		draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
}
shader_reset();