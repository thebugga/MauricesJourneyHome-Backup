if use_dark
{
	for (var i = 0; i < array_length(objdark_arr); i++)
	{
		with (objdark_arr[i])
		{
			if visible
			{
				var b = get_dark(image_blend, other.use_dark)
				draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, b, image_alpha)
			}
		}
	}
}
if (obj_player1.finisher or obj_player2.finisher or (obj_parent_player.state == states.playersuperattack && obj_parent_player.superattackstate == states.transitioncutscene))
	finisher_alpha = approach(finisher_alpha, 0.3, 0.1)
else if (finisher_alpha > 0)
	finisher_alpha = approach(finisher_alpha, 0, 0.02)
if (finisher_alpha > 0)
{
	draw_set_alpha(finisher_alpha)
	draw_rectangle_color(-32, -32, (room_width + 32), (room_height + 32), c_black, c_black, c_black, c_black, 0)
	draw_set_alpha(1)
}
var _kungfu = global.kungfu
with (obj_parent_enemy)
	draw_enemy(_kungfu, true)
shader_set(global.Pal_Shader)
with (obj_deatheffect)
{
	if (visible && bbox_in_camera(view_camera[0], 32))
	{
		pal_swap_set(spr_palette, paletteselect, 0)
		b = get_dark(image_blend, other.use_dark)
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, b, image_alpha)
	}
}
with (obj_heatafterimage)
{
	if visible
	{
		pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0)
		draw_sprite_ext(obj_player1.sprite_index, obj_player1.image_index, x, y, obj_player1.xscale, obj_player1.yscale, 1, c_white, alpha)
		pattern_reset()
		reset_shader_fix()
	}
}
with (obj_parent_player)
{
	draw_player()
}
shader_set(shd_hit)
with (obj_parent_enemy)
{
	_stun = 0
	if (state == states.stun)
		_stun = 25
	if (visible && flash && bbox_in_camera(view_camera[0], 32))
	{
		var xstretch
var ystretch


var image_xscalestretch = 1
var image_yscalestretch = 0.5


if image_xscale == 1
    xstretch = (image_xscale + image_xscalestretch)
else if image_xscale == -1
    xstretch = (image_xscale - image_xscalestretch)
if image_yscale > 0
    ystretch = (image_yscale + image_yscalestretch)
else if image_yscale < 0
    ystretch = (image_yscale - image_yscalestretch)
	
	
if image_xscalestretch > 0
    image_xscalestretch -= 0.1
if image_xscalestretch < 0
    image_xscalestretch += 0.1
	
	
if image_yscalestretch > 0
    image_yscalestretch -= 0.1
if image_yscalestretch < 0
    image_yscalestretch += 0.1
	
draw_sprite_ext(sprite_index,image_index,x,y,xstretch, ystretch,image_angle,image_blend,image_alpha)


	}
}
with (obj_smallnumber)
{
	if (visible && flash)
		draw_text(x, y, number)
}
shader_reset()
