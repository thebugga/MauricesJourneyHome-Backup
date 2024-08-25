if !bounce
{
	draw_clear(c_green)
	if dx > -16
		dx--
	else
		dx = 0
	draw_sprite_ext(spr_title_Dscroll, 0, dx, 240, 160, 4, 0, c_white, 1)
	if mx < 0
		mx++
	else
		mx = -64
	draw_sprite_ext(spr_title_Mscroll, 0, mx, 152, 16, 1, 0, c_white, 1)
}
draw_sprite_ext(spr_title_doise, 0, 580, 370, 1, 1, 0, c_white, doisealpha * image_alpha)
var leftx = ((sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index)) / (sprite_get_width(sprite_index) / 2))
var rightx = ((sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index)) / (sprite_get_width(sprite_index) / 2))
var realtop = (sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index))
var realbottom = (sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index))
draw_sprite_pos(sprite_index, image_index, x + (leftx * anglex), (y + realtop) + (leftx * angley1), x + (rightx * anglex), (y + realtop) + (rightx * angley1), x + (rightx * anglex), (y + realbottom) - (rightx * angley2), x + (leftx * anglex), (y + realbottom) - (leftx * angley2), image_alpha)
draw_set_alpha(flashalpha)
draw_rectangle_color(0, 0, 960, 540, c_white, c_white, c_white, c_white, 0)
draw_set_alpha(1)