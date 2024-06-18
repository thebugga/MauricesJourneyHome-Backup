var _w = 960
var _h = 540
var ds_h = 0
display_set_gui_size(_w, _h)
font = font_add_sprite_ext(spr_font,"abcdefghijklmnopqrstuvwxyz!.1234567890:", 1, 0)
draw_set_font(font)
var x1 = rpadding
var y1 = (_h - (((dialogheight + rpadding) + (padding * 2)) + ds_h))
draw_set_halign(fa_left)
draw_set_valign(fa_top)
var collect_x = irandom_range(-collect_shake, collect_shake);
var collect_y = irandom_range(-collect_shake, collect_shake);
if collect_shake > 0
    collect_shake = 4
for (var i = 0; i < 3; i++)
{
var dial = dialogsidel[i]
if (dial != -4 && dial != dialogcharacter)
draw_sprite_ext(talk_sprites[dial][0][0],0, (rpadding + (75 * i)), y1,1,1,0,c_gray,1)
var diar = dialogsider[i]
if (diar != -4 && diar != dialogcharacter)
draw_sprite_ext(talk_sprites[diar][0][0],0, ((_w - rpadding) - (75 * i)), y1,-1,1,0,c_gray,1)
}
var sidescale = 1
if dialogcharx > 480
sidescale = -1
if (dialogsprite != -4)
    draw_sprite_ext(dialogsprite, dialogindex, (dialogcharx + collect_x), (y1 + collect_y),sidescale,1,0,c_white,1)
var bw = ((_w - rpadding) - x1)
var bh = ((_h - rpadding) - y1 + 16)
draw_sprite(spr_tutorialbubble_rope, 0, (rpadding * 2), _h - 6)
draw_sprite(spr_tutorialbubble_rope, 0, (_w - (rpadding * 2)), _h - 6)
if (!surface_exists(surf))
    surf = surface_create(_w, _h)
if (!surface_exists(clip))
    clip = surface_create(_w, _h)
gpu_set_blendmode(bm_normal) 
surface_set_target(clip)
draw_set_alpha(1)
draw_clear(c_white)
gpu_set_blendmode(bm_subtract)
draw_sprite_ext(spr_tutorialbubble, 0, x1, y1 - 8, (bw / sprite_get_width(spr_tutorialbubble)), (bh / sprite_get_height(spr_tutorialbubble)), 0, c_white, 1)
surface_reset_target()
gpu_set_blendmode(bm_normal) 
surface_set_target(surf)
draw_sprite_tiled(spr_checkerboard, 0, 0, 0)
gpu_set_blendmode(bm_subtract)
draw_surface(clip, 0, 0)
gpu_set_blendmode(bm_normal) 
surface_reset_target()
draw_set_alpha(1)
draw_surface(surf, 0, 0)
draw_sprite_ext(spr_tutorialbubble, 1, x1, y1- 8, (bw / sprite_get_width(spr_tutorialbubble)), (bh / sprite_get_height(spr_tutorialbubble)), 0, c_white, 1)
draw_text_color((x1 + padding + 10), ((y1 + padding + 10) + ds_h), displaytext, c_white, c_white, c_white, c_white, 1) 