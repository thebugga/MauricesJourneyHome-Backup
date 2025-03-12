switch state
{
	case states.idle:
		scr_enemy_idle();
		break;
	case states.charge:
		scr_enemy_charge();
		break;
	case states.turn:
		scr_enemy_turn();
		break;
	case states.walk:
		scr_enemy_walk();
		break;
	case states.land:
		scr_enemy_land();
		break;
	case states.hit:
		scr_enemy_hit();
		break;
	case states.stun:
		scr_enemy_stun();
		break;
	case states.pizzagoblinthrow:
		scr_pizzagoblin_throw();
		break;
	case states.grabbed:
		scr_enemy_grabbed();
		break;
	case states.rage:
		scr_enemy_rage();
		break;
	case states.ghostpossess:
		scr_enemy_ghostpossess();
		break;
}
scr_scareenemy();
	state = states.walk;
if state == states.stun && stunned > 40 && birdcreated == 0
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if state != states.stun
	birdcreated = false;
if flash == 1 && alarm[2] <= 0
	alarm[2] = 0.15 * room_speed;
var player = instance_nearest(x, y, obj_parent_player);
if elite && ragecooldown > 0
	ragecooldown--;
if state == states.walk && state != states.stun && sprite_index == walkspr && sprite_index != spr_cheeserobot_scared && elite && ragecooldown == 0
{
	if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 60) && y >= (player.y - 60)))
	{
		if x != player.x
			image_xscale = -sign(x - player.x);
		state = states.rage;
		sprite_index = spr_cheeserobot_howl;
		image_index = 0;
		shot = false;
		ragedash = 100;
		hsp = 0;
	}
}
if (!grounded && sprite_index == spr_cheeserobot_jump && floor(image_index) == image_number - 1)
	image_speed = 0;
else if image_speed == 0
	image_speed = 0.35;
if (sprite_index == spr_cheeserobot_land && floor(image_index) == image_number - 1)
	sprite_index = spr_cheeserobot_walk;
if state != states.grabbed
	depth = 0;
if state != states.stun
	thrown = false;
if boundbox == 0
{
	with (instance_create(x, y, obj_parent_enemycollisionbox))
	{
		sprite_index = other.sprite_index;
		mask_index = other.sprite_index;
		baddieID = other.id;
		other.boundbox = true;
	}
}
