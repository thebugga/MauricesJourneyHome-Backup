scr_getinput(!obj_player1.player_index)

if key_taunt2
	input_buffer_taunt = 5;
	
if room == rank_room
	visible = false;
else
	visible = true;
playerid = obj_player1.id;
image_speed = 0.35;
if key_taunt2 && taunttimer <= 0 && usable
{
	taunttimer = 20;
	sprite_index = spr_taunt;
	image_speed = 0;
	tauntID = instance_create(x, y, obj_baddietaunteffect);
	tauntID.depth = 0;
	fmod_event_one_shot_3d("event:/sfx/pep/taunt", x, y);
	image_index = irandom(sprite_get_number(spr_taunt) - 1);
}
if !isgustavo && key_taunt
	breakdance_pressed++;
//if room == hub_lobby or room == hub_theatre
//	visible = false
//else
//	visible = true
scr_followcharacterspr()
if input_buffer_taunt > 0
	input_buffer_taunt--;