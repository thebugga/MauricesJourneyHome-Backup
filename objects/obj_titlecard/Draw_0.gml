draw_sprite_ext(spr_titlecard_fracture, 0, x, y, fracturescale, fracturescale, fractureangle, c_white, 1)
with obj_parent_player
{
	for (var p = -1; p < 2; p += 2)
	{
        shader_set(shd_color_afterimage)
        shader_set_uniform_f(shader_get_uniform(shd_color_afterimage, "red"), p == -1 ? 0.17 : 0.8745098039215686)
        shader_set_uniform_f(shader_get_uniform(shd_color_afterimage, "green"), p == -1 ? 0.49 : 0.1843137254901961)
        shader_set_uniform_f(shader_get_uniform(shd_color_afterimage, "blue"), p == -1 ? 0.9 : 0)
		draw_sprite_ext(sprite_index, image_index, x + (other.playeroff * p), y + (other.playeroff * p), Xscale * scale_xs, Yscale * scale_ys, Rotation, c_white, image_alpha)
		shader_reset()
	}
	shader_set(global.Pal_Shader)
	draw_player()
	shader_reset()
}
var cardshakex = irandom_range(-wipshake, wipshake)
var cardshakey = irandom_range(-wipshake, wipshake)
var titlecardx = x + titlecredit[image_index][1] + cardx
var titlecardy = y + titlecredit[image_index][2]
draw_sprite_ext(spr_titlecards, image_index, titlecardx + cardshakex, titlecardy + cardshakey, 0.3, 0.3, 0, c_white, 1)
shader_set(global.Pal_Shader)
pal_swap_set(spr_peppalette, obj_player1.player_paletteselect[0], false)
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, obj_player1.player_patterntexture[0])
draw_sprite_ext(spr_titlecards_maurice, image_index, titlecardx + cardshakex, titlecardy + cardshakey, 0.3, 0.3, 0, c_white, 1)
pal_swap_set(spr_noisepalette, obj_player1.player_paletteselect[1], false)
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, obj_player1.player_patterntexture[1])
draw_sprite_ext(spr_titlecards_doise, image_index, titlecardx + cardshakex, titlecardy + cardshakey, 0.3, 0.3, 0, c_white, 1)
pattern_reset()
reset_shader_fix()
draw_sprite_ext(spr_titlecard_titles, image_index, titlecardx + cardshakex + irandom_range(-1, 1), titlecardy + cardshakey + irandom_range(-1, 1), 0.3, 0.3, 0, c_white, 1)

if wipshow
	draw_sprite_ext(spr_titlecards_wip, wipindex, titlecardx + irandom_range(-wipshake, wipshake), titlecardy + irandom_range(-wipshake, wipshake), wipscale, wipscale, wipangle, c_white, 1)

draw_set_halign(fa_center)
draw_set_valign(fa_top)
var creditx = x + titlecredit[image_index][3]
var credity = y + titlecredit[image_index][4]
for (var c = 0; c < 3; c++)
{
	draw_set_font(global.font_small)
	var carray = ["Storyboarded by", "Backgrounds by", "Composed by"]
	draw_text_color(creditx, credity, carray[c], c_white, c_white, c_white, c_white, creditalpha)
	credity += string_height(carray[c])
	draw_set_font(global.creditsfont)
	draw_text_color(creditx, credity, titlecredit[image_index][5 + c], c_white, c_white, c_white, c_white, creditalpha)
	credity += string_height(titlecredit[image_index][5 + c])
}