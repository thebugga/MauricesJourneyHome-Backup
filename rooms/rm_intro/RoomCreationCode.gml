scr_startinput();
global.truefont = font_add_sprite_ext(spr_truefont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz.:!0123456789?'\"ÁÄÃÀÂÉÈÊËÍÎÏÓÖÕÔÚÙÛÜáäãàâéèêëíîïóöõôúùûüÇç_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнль", true, 2)
global.bigfont = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0)
global.panic = false;
global.seconds = 10
global.minutes = 0
window_set_fullscreen(true)
window_enable_borderless_fullscreen(true)