event_inherited();
image_speed = 0.35;
depth = -6;
xoffset = 25;
yoffset = 0;
usable = true;
spritequeue = ds_queue_create();
animatronic = 0;
global.playerFollowCharacter = Characters.Doise
alarm[0] = 5;
taunttimer = 0;
tauntID = noone;
breakdance_pressed = 0;
breakdance_speed = 0.25;
breakdance_index = 0;
notecreate = 0;
grabbuffer = 0;
steppybuffer = 0;
input_buffer_taunt = 0

get_character_spr = function()
{
	taunttimer = 0;
	breakdance_pressed = 0;
	breakdance_index = 0;
	instance_destroy(tauntID);
	tauntID = -4;
	scr_followcharacterspr();
	
	if global.playerFollowCharacter == Characters.Maurice
	{
		spr_palette = spr_peppalette;
		spr_idle = spr_player_idle;
		spr_move = spr_player_move;
		spr_taunt = spr_player_taunt;
		spr_suplexdash = spr_player_kungfu1
	    spr_breakdance = spr_player_breakdance
		spr_air = spr_player_jump;
		spr_fall = spr_player_fall
		spr_deathend = spr_player_deathend
		spr_dead = spr_player_deathend
		spr_walkfront = spr_player_walkfront
		spr_Timesup = spr_player_timesup
		spr_animatronic = spr_pepanimatronic;
		spr_fightball = spr_player_fightball;
		
	}
	else if global.playerFollowCharacter == Characters.Doise
	{
		spr_palette = spr_noisepalette;
		spr_idle = spr_playerN_idle;
		spr_move = spr_playerN_move;
		spr_taunt = spr_playerN_taunt;
		spr_suplexdash = spr_playerN_suplexgrab
		spr_walkfront = spr_playerN_walkfront
	    spr_breakdance = spr_playerN_breakdance
		spr_air = spr_playerN_doublejump;
		spr_fall = spr_playerN_fall
		spr_deathend = spr_playerN_deathend
		spr_dead = spr_playerN_deathend
		spr_Timesup = spr_playerN_timesup
		spr_animatronic = spr_pepanimatronic;
		spr_fightball = spr_playerN_fightball;
	}
}
get_character_spr();

is_visible = true;
sprite_index = spr_idle;
