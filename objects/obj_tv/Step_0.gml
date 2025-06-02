var p = obj_player

visible = true
if cardboardtimer > 0
	cardboardtimer--
else
	cardboardindex = -4
		
if (string_starts_with(room_get_name(room), "tower") || room == rank_room || room == rm_timesup || instance_exists(obj_titlecard) || room == mainmenu || global.boss_room)
	visible = false

if !visible
	state = tv_states.off

switch (state)
{
	case tv_states.off:
		sprite_index = spr_tv_off
		if !visible
			image_index = 0
		if anim_ended()
			state = tv_states.normal
		break;
	case tv_states.normal:
		if cardboardindex == 3
			sprite_index = spr_tv_hurt
		else if global.combo.count >= 50
			sprite_index = spr_tv_combo
		else if (sprite_index != spr_tv_idleangry && sprite_index != spr_tv_idlelook)
			sprite_index = spr_tv_idle
		
		if idletimer > 0
			idletimer--
		else if sprite_index == spr_tv_idle
		{
			idletimer = 240
			reset_anim(choose(spr_tv_idleangry, spr_tv_idlelook))
		}
		
		if (anim_ended() && (sprite_index == spr_tv_idleangry || sprite_index == spr_tv_idlelook))
			sprite_index = spr_tv_idle
		
		if cardboardtimer == 0
		{
			if global.panic.active
				cardboardindex = 4
			if (p.state == states.mach3 || p.state == states.climbwall || p.sprite_index == p.spr_machslideboost3)
				cardboardindex = 0
			if p.state == states.mach3 && abs(obj_player.hsp) >= 16
				cardboardindex = 1
		}
		break;
	case tv_states.transition:
		if t_index + 0.35 < sprite_get_number(spr_tv_trans)
			t_index += 0.35
		else
		{
			state = state_togo
			sprite_index = expr_sprite
		}
		break;
	case tv_states.expr:
		switch (sprite_index)
		{
			case spr_tv_hurt:
				if p.state == states.hurt
					alarm[0] = 120
				break;
		}
		break;
}


if cardboardvisual != cardboardindex
{
	cardboardy = approach(cardboardy, 268, 6)
	if cardboardy >= 268
		cardboardvisual = cardboardindex
}
else if cardboardvisual != -4
	cardboardy = approach(cardboardy, 134, 6)

var y_goto = ystart
if (obj_player.x < 250 && obj_player.y < 175) || !visible
	y_goto = -500
	
y = approach(y, y_goto, 25)

switch (combo.sprite)
{
	case spr_combo_arms_trans:
		combo.angle = 360
		combo.speedd = 0.35
		combo.index = approach(combo.index, (global.combo.count > 0) * (sprite_get_number(combo.sprite) - 1), combo.speedd)
		if global.combo.count > 0 && combo.index == sprite_get_number(combo.sprite) - 1
			combo.sprite = spr_combo_arms_idle
		break;
	case spr_combo_arms_idle:
		combo.angle = lerp(combo.angle, (global.combo.timer / 60) * 360, 0.1)
		combo.speedd = 0.5 - ((global.combo.timer / 60) * 0.3)
		//combo.index = wrap(sprite_get_number(combo.sprite) - 1, combo.index + combo.speedd)
		if global.combo.timer <= 0
		{
			combo.sprite = spr_combo_arms_trans
			combo.index = sprite_get_number(combo.sprite) - 1
		}
		break;
}
