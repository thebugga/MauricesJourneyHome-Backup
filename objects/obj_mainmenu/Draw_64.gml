if instance_exists(obj_option)
	exit
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(global.creditsfont)
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
	case states.transition:
		if flicker
			draw_text(480, 270, concat("File ", saveselect))
		draw_sprite(spr_controlseggplant, 0, 800 + irandom_range(-1, 1), 100 + irandom_range(-1, 1))
		break
}