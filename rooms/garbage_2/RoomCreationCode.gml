pal_swap_init_system(shd_pal_swapper)
if global.panic
{
    var lay1 = layer_get_id("Backgrounds_stillscroll")
    layer_background_sprite(layer_background_get_id(lay1), bg_garbagrbackpanic)
    var lay2 = layer_get_id("Backgrounds_still2")
    layer_background_sprite(layer_background_get_id(lay2), bg_garbagrfrontpanic)
}

