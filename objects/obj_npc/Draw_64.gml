
if bubble.y <= -bubble.h
	exit;

draw_sprite(spr_dialogue_rope, 0, bubble.x + padding, bubble.y)
draw_sprite(spr_dialogue_rope, 0, bubble.x + bubble.w - padding, bubble.y)

if !surface_exists(bubble_surf)
	bubble_surf = surface_create(bubble.w, bubble.h)
else
{
	surface_set_target(bubble_surf)
	
	draw_clear(c_black)
	
	draw_sprite_tiled(spr_bgkitty, 0, bg_pos.x, bg_pos.y)
	
	gpu_set_blendmode(bm_subtract)
	draw_sprite_stretched(spr_dialogue_bubble, 2, 0, 0, bubble.w, bubble.h)
	gpu_set_blendmode_cc(bm_normal)
	surface_reset_target()
	
	draw_surface(bubble_surf, bubble.x, bubble.y)
}

draw_sprite_stretched(spr_dialogue_bubble, 1, bubble.x, bubble.y, bubble.w, bubble.h)

draw_set_font(global.tutorialfont)
draw_set_align(fa_left, fa_top, c_black)


draw_special_text(bubble.x + text_padding, bubble.y + (text_padding / 2), scr_separate_text(text, bubble.w - (padding * 2)))