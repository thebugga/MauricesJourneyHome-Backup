if ds_list_find_index(global.ds_saveroom, id) != -1
	exit;

if sprite_index != spr_secretportal_enter
	reset_anim(spr_secretportal_enter)

if !IsSecret
{
	obj_music.secretsound = true;
	obj_music.secretend = false;
}
else
{
	obj_music.secretend = true;
	obj_music.secretsound = false;
}

other.target_room = "secret" //prevents the lap portal from breaking shit

do_hold_player(true)