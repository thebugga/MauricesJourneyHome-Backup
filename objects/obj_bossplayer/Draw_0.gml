shader_set(global.Pal_Shader)
pal_swap_set(obj_parent_player.spr_palette, obj_parent_player.paletteselect, false)
//pattern_set(global.Base_pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, funnyangle, image_blend, image_alpha)
pattern_reset()
reset_shader_fix()