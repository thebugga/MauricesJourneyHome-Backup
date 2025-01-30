shader_set(global.retro_pal_swapper)
pal_swap_set(obj_parent_player.spr_palette, obj_parent_player.paletteselect, false)
////pattern_setup(global.patterntexture, [1,2], sprite_index, image_index, 1, 1, 1, 1);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, funnyangle, image_blend, image_alpha)
//pattern_reset()
reset_shader_fix()