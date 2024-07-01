event_inherited();
image_speed = 0.35;
depth = -6;
xoffset = 25;
yoffset = 0;
usable = true;
spritequeue = ds_queue_create();
ispeppino = false;
isgustavo = false;
animatronic = 0;
character = "P";
alarm[0] = 5;
taunttimer = 0;
tauntID = noone;
breakdance_pressed = 0;
breakdance_speed = 0.25;
breakdance_index = 0;
notecreate = 0;
grabbuffer = 0;
steppybuffer = 0;

get_character_spr = function()
{
	taunttimer = 0;
	breakdance_pressed = 0;
	breakdance_index = 0;
	instance_destroy(tauntID);
	tauntID = -4;
	scr_characterspr();
	
		spr_palette = spr_parmpalette;
		spr_idle = spr_parmesan_idle;
		spr_move = spr_parmesan_idle;
		spr_dead = spr_parmesan_idle
		spr_taunt = spr_parmesan_idle;
		spr_suplexdash = spr_parmesan_idle
		spr_deathend = spr_parmesan_idle
		spr_Timesup = spr_parmesan_idle
		spr_walkfront = spr_parmesan_idle
	    spr_breakdance = spr_parmesan_idle
		spr_air = spr_parmesan_idle;
		spr_fall = spr_parmesan_idle
		spr_animatronic = spr_parmesan_idle;
		spr_fightball = spr_parmesan_idle;
}
get_character_spr();

is_visible = true;
sprite_index = spr_idle;
