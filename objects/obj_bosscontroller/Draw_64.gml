if (bossID == noone)
	exit;
if (!instance_exists(bossID))
	exit;
/*
switch state
{
	case BCstates.arenaintro:
		draw_sprite_tiled(spr_versusflame, -1, 0, flamey)
		var sprplayer = (playerx != 0 ? playersprshadow : playerspr)
		var sprboss = (playerx != 0 ? bosssprshadow : bossspr)
		draw_sprite(sprplayer, -1, playerx, 540)
		draw_sprite(sprboss, -1, bossx, 540)
		var xx = irandom_range(-1, 1)
		var yy = irandom_range(-1, 1)
		draw_sprite(vstitle, -1, xx, (vsy + yy))
		if flash
		{
			shader_set(shd_hit)
			draw_sprite(sprplayer, -1, playerx, (540 - sprite_get_height(sprplayer)))
			draw_sprite(sprboss, -1, bossx, (540 - sprite_get_height(sprboss)))
			draw_sprite(vstitle, -1, xx, (vsy + yy))
			shader_reset()
		}
		exit;
}
*/
draw_set_font(global.creditsfont)
draw_set_color(c_white)
draw_text(round_x, round_y, round_count >= 6 ? "FINAL ROUND!!!" : "Round " + string(round_count))
//draw_sprite(spr_bossrounds, _round, round_x, round_y)

draw_text(screen_w / 2, 50, round_timer)

var teamY = [0, 0]
with obj_bossplayer
{
	draw_healthbar((screen_w - 250) * team, 16 * teamY[team], screen_w - ((screen_w - 250) * !team), 24 + (16 * teamY[team]), (HP / HP_max) * 100, c_dkgray, c_red, c_lime, team, 1, 1)
	draw_healthbar((screen_w - 250) * team, 24 + (16 * teamY[team]), screen_w - ((screen_w - 250) * !team), 32 + (16 * teamY[team]), SP >= 100 ? 100 : SP, c_dkgray, c_aqua, c_aqua, team, 1, 1)
	
	teamY[team]++
}
