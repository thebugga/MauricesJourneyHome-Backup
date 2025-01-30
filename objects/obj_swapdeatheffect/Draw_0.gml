shader_set(global.retro_pal_swapper)
if (!ispeppino)
    spr_palette = spr_peppalette
else
{
    spr_palette = spr_noisepalette
}
pal_swap_set(spr_palette, paletteselect, false)
//pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, patterntexture)
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1)
//pattern_reset()
shader_reset()
