var holesurface = surface_create(screen_w, screen_h)
var colorizesurface = surface_create(screen_w, screen_h)
surface_set_target(holesurface)

draw_clear(c_white)
gpu_set_blendmode(bm_subtract)
draw_circle(screen_w / 2, screen_h / 2, fracturescale * 1000, false)
gpu_set_blendmode(bm_normal)
surface_reset_target()

surface_set_target(colorizesurface)
shader_set(shd_colorizebutashader);

var s_intensity = shader_get_uniform(shd_colorizebutashader, "g_Intensity");
var s_color = shader_get_uniform(shd_colorizebutashader, "g_TintCol");
shader_set_uniform_f(s_intensity, 1.0);
shader_set_uniform_f(s_color, titlecredit[image_index][5][0], titlecredit[image_index][5][1], titlecredit[image_index][5][2], titlecredit[image_index][5][3]);
draw_surface(application_surface, 0, 0)
shader_reset();

gpu_set_blendmode(bm_subtract)
draw_surface(holesurface, 0, 0)
gpu_set_blendmode(bm_normal)

surface_reset_target()

draw_surface(colorizesurface, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]))
surface_free(holesurface)
surface_free(colorizesurface)
draw_sprite_ext(spr_titlecard_fracture, 0, x, y, fracturescale, fracturescale, fractureangle, c_white, 1)
draw_sprite_ext(spr_titlecard_pinhole, 0, x, y, pinholescale, pinholescale, 0, c_white, pinholealpha)
with obj_player
{
	for (var p = -1; p < 2; p += 2)
	{
        shader_set(shd_solidcolor)
        shader_set_uniform_f(shader_get_uniform(shd_solidcolor, "red"), p == -1 ? 0.17 : 0.8745098039215686)
        shader_set_uniform_f(shader_get_uniform(shd_solidcolor, "green"), p == -1 ? 0.49 : 0.1843137254901961)
        shader_set_uniform_f(shader_get_uniform(shd_solidcolor, "blue"), p == -1 ? 0.9 : 0)
		draw_sprite_ext(sprite_index, image_index, x, y, xscale * visual_size, image_yscale * visual_size, image_angle, image_blend, image_alpha)
		shader_reset()
	}
	event_perform(ev_draw, ev_draw_normal)
}
var cardshakex = irandom_range(-wipshake, wipshake)
var cardshakey = irandom_range(-wipshake, wipshake)
var titlecardx = x + titlecredit[image_index][1] + cardx
var titlecardy = y + titlecredit[image_index][2]
draw_sprite(spr_titlecards, image_index, titlecardx + cardshakex, titlecardy + cardshakey)
/*
shader_set(global.Pal_Shader)
pal_swap_set(spr_peppalette, obj_player.player_paletteselect[0], false)
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, obj_player1.player_patterntexture[0])
draw_sprite(spr_titlecards_maurice, image_index, titlecardx + cardshakex, titlecardy + cardshakey)
pal_swap_set(spr_noisepalette, obj_player1.player_paletteselect[1], false)
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, obj_player1.player_patterntexture[1])
draw_sprite(spr_titlecards_doise, image_index, titlecardx + cardshakex, titlecardy + cardshakey)
pattern_reset()
reset_shader_fix()
*/
draw_sprite(spr_titlecard_titles, image_index, titlecardx + cardshakex + irandom_range(-1, 1), titlecardy + cardshakey + irandom_range(-1, 1))

if wipshow
	draw_sprite_ext(spr_titlecards_wip, wipindex, titlecardx + irandom_range(-wipshake, wipshake), titlecardy + irandom_range(-wipshake, wipshake), wipscale, wipscale, wipangle, c_white, 1)

draw_set_halign(fa_center)
draw_set_valign(fa_top)
var creditx = x + titlecredit[image_index][3]
var credity = y + titlecredit[image_index][4]
for (var c = 0; c < 3; c++)
{
	draw_set_font(-4)
	var carray = ["Storyboarded by", "Backgrounds by", "Composed by"]
	draw_text_color(creditx, credity, carray[c], c_white, c_white, c_white, c_white, creditalpha)
	credity += string_height(carray[c])
	draw_set_font(global.generic_font)
	draw_text_color(creditx, credity, titlecredit[image_index][6 + c], c_white, c_white, c_white, c_white, creditalpha)
	credity += string_height(titlecredit[image_index][6 + c])
}