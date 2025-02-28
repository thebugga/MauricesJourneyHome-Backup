// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function animation_end(ind = sprite_index, img = image_index,  i_end = sprite_get_number(ind), i_spd = image_speed) 
{
    return (img + (i_spd) * sprite_get_speed(ind) / (sprite_get_speed_type(ind) == spritespeed_framespergameframe ? 1 : game_get_speed(gamespeed_fps)) >= i_end);    
}
