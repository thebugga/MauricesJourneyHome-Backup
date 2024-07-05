draw_set_halign(fa_middle)
draw_set_valign(fa_center)
draw_set_font(font_add_sprite_ext(spr_truefont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz:.!0123456789?'\"ÁÄÃÀÂÉÈÊËÍÎÏÓÖÕÔÚÙÛÜáäãàâéèêëíîïóöõôúùûüÇç_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнль/", true, 2))
switch state
{
	case states.actor:
		draw_text(480, 500, "Press Start")
		break
	case states.transitioncutscene:
		if flicker
			draw_text(480, 500, "Press Start")
		break
	case states.normal:
		draw_text(480, 270, concat("File ", saveselect))
		break
	case states.transition:
		if flicker
			draw_text(480, 270, concat("File ", saveselect))
		break
}