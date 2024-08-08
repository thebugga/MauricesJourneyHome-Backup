switch state
{
	case states.idle:
		scr_enemy_idle()
		break
	case states.charge:
		scr_enemy_charge()
		break
	case states.turn:
		scr_enemy_turn()
		break
	case states.walk:
		scr_enemy_walk()
		break
	case states.land:
		scr_enemy_land()
		break
	case states.hit:
		scr_enemy_hit()
		break
	case states.stun:
		scr_enemy_stun()
		break
	case states.pizzagoblinthrow:
		scr_pizzagoblin_throw()
		break
	case states.grabbed:
		scr_enemy_grabbed()
		break
}

if (state == states.stun && stunned > 40 && birdcreated == 0)
{
	birdcreated = 1
	with (instance_create(x, y, obj_enemybird))
		ID = other.id
}
if (state != states.stun)
	birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)
scr_scareenemy()
if (hp <= 0)
	instance_destroy()
if (state != states.grabbed)
	depth = 0
if (state != states.stun)
	thrown = false
if (bombreset > 0)
	bombreset--
var player = instance_nearest(x, y, obj_player)
if (state != states.pizzagoblinthrow && bombreset <= 0 && grounded)
{
	if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 20) && y >= (player.y - 20))
	{
		if (state == states.walk or state == states.idle)
		{
			if x != player.x
				image_xscale = (-(sign((x - player.x))))
			image_index = 0
			state = states.pizzagoblinthrow
		}
	}
}

if (boundbox == 0)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index
		mask_index = other.sprite_index
		baddieID = other.id
		other.boundbox = 1
	}
}