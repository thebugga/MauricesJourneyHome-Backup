if (room == rm_eggplantdisclaimer or room == rm_logo or room == REALLYREALTitlescreen or room == rank_room or room == rm_levelselect or room == timesuproom or room == characterselect or room == hub_loadingscreen or (string_copy(room_get_name(room), 1, 3) == "hub" && !global.panic))
{
	visible = false
	sprite_index = spr_tv_off
}
else
	visible = true
if (instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud))
	visible = false
image_speed = 0.35
if (targetgolf != noone && (!instance_exists(targetgolf)))
	targetgolf = -4
if (targetgolf != -4 && (!view_visible[1]))
{
	view_visible[1] = true
	view_enabled = true
}

combo_posX = Wave(-5, 5, 2, 20)
if (global.combotime > 0 && global.combo != 0)
{
	switch combo_state
	{
		case 0:
			combo_posY += combo_vsp
			combo_vsp += 0.5
			if (combo_posY > 20)
				combo_state++
			break
		case 1:
			combo_posY = lerp(combo_posY, 0, 0.05)
			if (combo_posY < 1)
			{
				combo_posY = 0
				combo_vsp = 0
				combo_state++
			}
			break
		case 2:
			if (global.combotime < 30)
			{
				combo_posY += combo_vsp
				if (combo_vsp < 20)
					combo_vsp += 0.5
				if (combo_posY > 0)
				{
					combo_posY = 0
					combo_vsp = -1
					if (global.combotime < 15)
						combo_vsp = -2
				}
			}
			else
				combo_posY = Approach(combo_posY, 0, 10)
			break
	}

}
else
{
	combo_posY = Approach(combo_posY, -500, 5)
	combo_vsp = 0
	combo_state = 0
}
combofill_index += 0.35
if (combofill_index > (sprite_get_number(spr_tv_combobubblefill) - 1))
	combofill_index = frac(combofill_index)

if global.combo > 0
{
	comboend = true;
	var ct = global.combotime;
	if ct <= 40
	{
		if alarm[5] == -1
		{
			if ct >= 20
				alarm[5] = 12;
			else
				alarm[5] = 5;
		}
	}
	else
		combobubblevisible = true;
}
else if comboend
{
	comboend = false;
	event_perform(2, 4);
}
if (prompt != -4 && prompt != "")
	newsy = Approach(newsy, 470, 5)
else
	newsy = Approach(newsy, 540, 5)
switch state
{
	case states.normal:
		idlespr = spr_tv_idle
		cardboardsprite = -4
		if (global.combo >= 3 && (!obj_parent_player.isgustavo))
			idlespr = spr_tv_exprcombo
		if (global.combo >= 50 && (!obj_parent_player.isgustavo))
			idlespr = spr_tv_exprheat
		if global.panic
			idlespr = spr_tv_exprpanic
		if obj_parent_player.isgustavo
		{
			idlespr = spr_tv_idleG
			if global.panic
				idlespr = spr_tv_escapeG
		}
		
		var _state = obj_player1.state
		if (_state == states.backbreaker or _state == states.chainsaw)
			_state = obj_player1.tauntstoredstate
		
		var _transfo = 1
		switch _state
		{
			case states.knightpep:
			case states.knightpepattack:
			case states.knightpepslopes:
				cardboardsprite = spr_tv_knight
				break
			case states.bombpep:
				cardboardsprite = spr_tv_bombpep
				break
			case states.fireass:
				cardboardsprite = spr_tv_fireass
				if (obj_player1.sprite_index == obj_player1.spr_scaredjump1 or obj_player1.sprite_index == obj_player1.spr_scaredjump2)
					cardboardsprite = spr_tv_scaredjump
				break
			case states.tumble:
				if (obj_player1.sprite_index == obj_player1.spr_tumble or obj_player1.sprite_index == obj_player1.spr_tumblestart or obj_player1.sprite_index == obj_player1.spr_tumbleend)
					cardboardsprite = spr_tv_tumble
				break
			case states.firemouth:
				cardboardsprite = spr_tv_firemouth
				break
			case states.ghost:
			case states.ghostpossess:
				cardboardsprite = spr_tv_ghost
				break
			case states.stunned:
				if (obj_player1.sprite_index == obj_player1.spr_squished)
					cardboardsprite = spr_tv_squished
				break
			case states.normal:
			case states.jump:
			case states.handstandjump:
			case states.crouch:
			case states.ladder:
				with (obj_player1)
				{
					if shotgunAnim
						other.idlespr = spr_tv_shotgun
					else if global.mort
						other.idlespr = spr_tv_mort
				}
				break
			case states.freefallprep:
			case states.freefall:
			case states.freefallland:
				if obj_player1.shotgunAnim
					cardboardsprite = spr_tv_shotgun
				break
			case states.pistol:
				if global.mort
					cardboardsprite = spr_tv_mort
				break
			case states.shotgun:
			case states.shotgunfreefall:
			case states.shotgunjump:
			case states.shotgundash:
			case states.shotguncrouch:
			case states.shotguncrouchjump:
				cardboardsprite = spr_tv_shotgun
				break
			case states.barrel:
				cardboardsprite = spr_tv_barrel
				break
			case states.golf:
				cardboardsprite = spr_tv_golf
				break
			case states.rocket:
				cardboardsprite = spr_tv_rocket
				break
			case states.cheeseball:
				cardboardsprite = spr_tv_cheeseball
				break
			case states.cheesepep:
			case states.cheesepepstick:
			case states.cheesepepstickside:
			case states.cheesepepstickup:
				cardboardsprite = spr_tv_cheesepep
				break
			case states.boxxedpep:
			case states.boxxedpepjump:
			case states.boxxedpepspin:
				cardboardsprite = spr_tv_boxxedpep
				break
			case states.mach2:
			case states.climbwall:
			case states.machroll:
			case states.grind:
				if obj_player1.skateboarding
					cardboardsprite = spr_tv_clown
				break
			default:
				_transfo = 0
				break
		}
		if global.playerCharacter != Characters.Maurice
		{
			var spr = sprite_get_name(idlespr)
			spr = asset_get_index(concat(spr, "N"))
			if (spr > -1)
				idlespr = spr
		}
		if (!_transfo) && expressionbuffer == 0
		{
			with (obj_player1)
			{
				if (mach4mode == 1)
					tv_do_expression(spr_tv_exprmach4)
				else if (state == states.mach3 or sprite_index == spr_mach3boost)
					tv_do_expression(spr_tv_exprmach3)
				if (state == states.hurt)
					tv_do_expression(spr_tv_exprhurt)
				else if (state == states.ratmounthurt)
					tv_do_expression(spr_tv_hurtG)
			}
		}
		switch sprite_index
		{
			case spr_tv_off:
				if visible
				{
					sprite_index = spr_tv_open
					image_index = 0
				}
				break
			case spr_tv_open:
				if (floor(image_index) == (image_number - 1))
					sprite_index = idlespr
				break
			case spr_tv_idle:
			case spr_tv_idleN:
				if (idleanim > 0)
					idleanim--
				if (sprite_index != idlespr)
					sprite_index = idlespr
				if (idleanim <= 0 && floor(image_index) == (image_number - 1))
				{
					sprite_index = choose(spr_tv_idleanim1, spr_tv_idleanim2)
					if global.playerCharacter != Characters.Maurice
					{
						var spr = sprite_get_name(sprite_index)
						spr = asset_get_index(concat(spr, "N"))
						if (spr > -1)
							sprite_index = spr
					}
					image_index = 0
				}
				break
			case spr_tv_idleanim1:
			case spr_tv_idleanim2:
			case spr_tv_idleanim1N:
			case spr_tv_idleanim2N:
				if (floor(image_index) == (image_number - 1))
				{
					sprite_index = idlespr
					idleanim = (240 + (60 * irandom_range(-1, 2)))
				}
				if (idlespr != spr_tv_idle && idlespr != spr_tv_idleN)
					sprite_index = idlespr
				break
			default:
				sprite_index = idlespr
		}

		if (sprite_index != spr_tv_open)
		{
			if (!ds_list_empty(tvprompts_list))
			{
				var b = ds_list_find_value(tvprompts_list, 0)
				prompt_buffer = prompt_max
				if (b[1] != "" && b[1] != -4)
				{
					headline = b[0]
					prompt = b[1]
					promptspd = b[4]
					promptx = 960
				}
				else
					prompt = -4
				if (b[2] == tvprompt.normal)
				{
					sprite_index = spr_tv_open
					image_index = 0
					tvsprite = b[3]
				}
				else
				{
					tvsprite = b[3]
				}
				state = states.tv_whitenoise
			}
			else
				prompt = -4
		}
		break
	case states.transitioncutscene:
		if (sprite_index == spr_tv_open && floor(image_index) == (image_number - 1)) || (sprite_index != spr_tv_open && sprite_index != tvsprite)
		{
			sprite_index = tvsprite
					image_index = 0
		}
		if (sprite_index == tvsprite)
		{
			if (prompt == -4 || prompt == "") && newsy == 540
			{
				promptx = 960
				ds_list_delete(tvprompts_list, 0)
				state = states.tv_whitenoise
			}
		}
		break
	case states.tv_whitenoise:
		if (noisebuffer > 0)
		{
			noisebuffer--
			noiseindex += 0.35
		}
		else
		{
			noisebuffer = 14
			noiseindex = 0
			if (prompt != -4 && prompt != "")
				state = states.transitioncutscene
			else if (expressionsprite != -4)
				state = states.tv_expression
			else
				state = states.normal
			image_index = 0
		}
		break
	case states.tv_expression:
		switch expressionsprite
		{
                case spr_tv_exprhurt1:
                case spr_tv_exprhurt2:
                case spr_tv_exprhurt3:
				{
					if (expressionbuffer > 0)
						expressionbuffer--
					else
					{
						state = states.tv_whitenoise
						expressionsprite = -4
					}
				}
				break
		}

		if (!ds_list_empty(tvprompts_list))
		{
			state = states.tv_whitenoise
			expressionsprite = -4
		}
		break
}
if global.playerCharacter != Characters.Maurice
{
	var spr = sprite_get_name(cardboardsprite)
	spr = asset_get_index(concat(spr, "N"))
	if (spr > -1)
		cardboardsprite = spr
}
if cardboardexprsprite != -4
{
	cardboardsprite = cardboardexprsprite
	switch cardboardsprite
	{
		case spr_tv_exprhurt:
        case spr_tv_exprhurtN:
			sprite_index = cardboardexprsprite
			cardboardsprite = spr_tv_exprhurtboard
			if (obj_player1.state != states.hurt)
			{
				if (expressionbuffer > 0)
					expressionbuffer--
				else
					cardboardexprsprite = -4
			}
			break
		case spr_tv_hurtG:
			if (obj_player1.state != states.ratmounthurt)
			{
				if (expressionbuffer > 0)
					expressionbuffer--
				else
					cardboardexprsprite = -4
			}
			break
		case spr_tv_exprcollect:
		case spr_tv_exprcollectN:
		case spr_tv_happyG:
			if (expressionbuffer > 0)
				expressionbuffer--
			else
				cardboardexprsprite = -4
			break
		case spr_tv_exprmach3:
		case spr_tv_exprmach3N:
			with (obj_player1)
			{
				if (state != states.mach3 && (state != states.chainsaw or tauntstoredstate != states.mach3) && sprite_index != spr_mach3boost && mach4mode == 0)
					other.cardboardexprsprite = -4
				if (mach4mode)
					tv_do_expression(spr_tv_exprmach4)
			}
			break
		case spr_tv_exprmach4:
		case spr_tv_exprmach4N:
			with (obj_player1)
			{
				if (mach4mode == 0)
					other.cardboardexprsprite = -4
			}
			break
	}
}
if cardboardvisual != cardboardsprite
{
	cardboardy = Approach(cardboardy, 268, 6)
	if cardboardy >= 268
		cardboardvisual = cardboardsprite
}
else if cardboardvisual != -4
	cardboardy = Approach(cardboardy, 134, 6)
var change_pos = 0
if (bubblespr == -4 && obj_player1.x < 224 && obj_player1.y < 300)
	change_pos = 1
var spd = 15
if change_pos
	hud_posY = Approach(hud_posY, -300, spd)
else
	hud_posY = Approach(hud_posY, 0, spd)
pizzaface_index += 0.35
johnface_index += 0.35
if (global.panic == true && global.fill > 0)
{
	showtime_buffer = 100
	if (!instance_exists(obj_ghostcollectibles))
		timer_x = Approach(timer_x, 0, 3)
	else
		timer_x = Approach(timer_x, -sprite_get_width(spr_timer_bar), 3)
	if global.playerCharacter == Characters.Maurice
		johnface_sprite = spr_timer_lysiaface
	else if global.playerCharacter == Characters.Doise
		johnface_sprite = spr_timer_felixface
}
else if global.panic
{
	if (pizzaface_sprite == spr_timer_pizzaface1)
	{
		pizzaface_sprite = spr_timer_pizzaface2
		pizzaface_index = 0
	}
	else if (pizzaface_sprite == spr_timer_pizzaface2)
	{
		if (floor(pizzaface_index) == (sprite_get_number(pizzaface_sprite) - 1))
		{
			pizzaface_sprite = spr_timer_pizzaface3
			pizzaface_index = 0
		}
	}
	else if (showtime_buffer > 0)
		showtime_buffer--
	else
		timer_x = Approach(timer_x, -sprite_get_width(spr_timer_bar), 2)
}
else
{
	pizzaface_sprite = spr_timer_pizzaface1
	timer_x = -(sprite_get_width(spr_timer_bar) * 2)
}
barfill_x -= 0.2
if (barfill_x < -173)
	barfill_x = 0
if (pizzaface_index > (sprite_get_number(pizzaface_sprite) - 1))
	pizzaface_index = frac(pizzaface_index)
if (johnface_index > (sprite_get_number(johnface_sprite) - 1))
	johnface_index = frac(johnface_index)
