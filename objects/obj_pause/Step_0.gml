if !pause && instance_exists(obj_player1) && obj_player1.key_start && room != Mainmenu && room != hub_loadingscreen && room != rank_room
{
	obj_player1.key_start = false;
	obj_player1.key_start2 = false;
	
	var _cutscenehandler = false;
	with obj_cutscene_handler
	{
		if !loop
			_cutscenehandler = true;
	}
	with obj_parent_player
	{
		if (state == states.victory && place_meeting(x, y, obj_startgate)) || (state == states.door && place_meeting(x, y, obj_exitgate))
			_cutscenehandler = true;
	}
	with obj_titlecard
		_cutscenehandler = true;
	with obj_taxi
	{
		if move
			_cutscenehandler = true;
	}
	if (obj_savesystem.state == 0 && !_cutscenehandler && (room != rank_room && room != ObjectnMacroloadinRoom && room != timesuproom) && !instance_exists(obj_jumpscare) && !instance_exists(obj_technicaldifficulty))
	{
		selected = 0;
		fadein = true;
		pause = true;

		fade = 0;
		
		pause_menu = ["pause_resume", "pause_options"];
		if global.leveltorestart != noone
		{
			array_push(pause_menu, "pause_restart");
			if global.leveltorestart != tower_tutorial_1 
				array_push(pause_menu, "pause_achievements");
			array_push(pause_menu, "pause_exit");
		}
		else
			array_push(pause_menu, "pause_exit_title");
		
        savedmusicmuffle = fmod_get_parameter("musicmuffle")
        fmod_set_parameter("musicmuffle", 1, 0)
		
		if global.leveltosave != -4
		{
			ini_open_from_string(obj_savesystem.ini_str);
			treasurefound = ini_read_real("Treasure", global.leveltosave, false);
			secretcount = ini_read_real("Secret", global.leveltosave, 0);
			ini_close();
			if !treasurefound
			{
				treasurefound = global.treasure;
				treasurealpha = 0;
			}
			else if !global.treasure
				treasurealpha = 0.5;
			else
				treasurealpha = 0;
			if global.secretfound > secretcount
			{
				secretcount = global.secretfound;
				secretalpha = 0;
			}
			else if global.secretfound < secretcount
				secretalpha = 0.5;
			else
				secretalpha = 0;
			if secretcount > 3
				secretcount = 3;
		}
		else
		{
			treasurefound = false;
			secretcount = 0;
		}
		scr_delete_pause_image();
		scr_create_pause_image();
		cursor_x = -60;
		cursor_y = -300;
		cursor_index = 0;
		backbuffer = 2;
		var _state = -4;
		var _txt = -4;
		with obj_player1
		{
			_state = state;
			if state == states.chainsaw
				_state = tauntstoredstate;
			switch _state
			{
				case states.knightpep:
				case states.knightpepslopes:
				case states.knightpepbump:
					_txt = lang_get_value("knighttip");
					break;
				case states.firemouth:
					_txt = lang_get_value("firemouthtip");
					break;
				case states.boxxedpep:
				case states.boxxedpepjump:
				case states.boxxedpepspin:
					_txt = lang_get_value("boxxedtip");
					if global.playerCharacter == Characters.Doise
						_txt = lang_get_value("boxxedtipN");
					break;
				case states.mort:
				case states.mortattack:
				case states.morthook:
				case states.mortjump:
					_txt = lang_get_value("morttip");
					break;
				case states.ghost:
					_txt = lang_get_value("ghosttip");
					if global.playerCharacter == Characters.Doise
						_txt = lang_get_value("ghosttipN");
					break;
				case states.rocket:
				case states.rocketslide:
					_txt = lang_get_value("rockettip");
					if global.playerCharacter == Characters.Doise
						_txt = lang_get_value("rockettipN");
					break;
				case states.barrel:
				case states.barrelclimbwall:
				case states.barreljump:
				case states.barrelslide:
					_txt = lang_get_value("barreltip");
					break;
				case states.antigrav:
					_txt = lang_get_value("antigravtip");
					if global.playerCharacter == Characters.Doise
						_txt = lang_get_value("antigravtipN");
					break;
				case states.cheesepep:
				case states.cheesepepstickside:
				case states.cheesepepstick:
				case states.cheesepepjump:
				case states.cheesepepstickup:
					_txt = lang_get_value("cheesedtip");
					break;
				case states.golf:
					_txt = lang_get_value("golftip");
					break;
				case states.rideweenie:
					_txt = lang_get_value("weenietip");
					break;
				case states.bombpep:
					if global.playerCharacter == Characters.Doise
						_txt = lang_get_value("bombtipN");
					break;
			}
			if _txt == noone
			{
				if shotgunAnim
					_txt = lang_get_value("shotguntip");
				else if global.noisejetpack
					_txt = lang_get_value("jetpack2tip");
			}
		}
		if _txt != noone
		{
			draw_set_font(lang_get_font("creditsfont"));
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			transfotext = scr_compile_icon_text(_txt);
			transfotext_size = scr_text_arr_size(transfotext);
		}
		else
			transfotext = noone;
		scr_pause_deactivate_objects();
	}
}
with obj_player1
{
	other.paletteselect = paletteselect;
	other.spr_palette = spr_palette;
}

border1_xstart = 0;
border1_ystart = SCREEN_HEIGHT;
border1_xend = -96;
border1_yend = SCREEN_HEIGHT + 100;
border2_xstart = SCREEN_WIDTH;
border2_ystart = SCREEN_HEIGHT;
border2_xend = SCREEN_WIDTH + 96;
border2_yend = SCREEN_HEIGHT + 100;

vine_ystart = 0;
vine_yend = -117;
if !start
{
	start = true;
	border2_x = border2_xend;
	border2_y = border2_yend;
	border1_x = border1_xend;
	border1_y = border1_yend;
	vine_y = vine_yend;
}
var a = 0.1;
	if fadein
	{
		fade = approach(fade, 1, 0.1);
		border1_x = lerp(border1_x, border1_xstart, a);
		border1_y = lerp(border1_y, border1_ystart, a);
		border2_x = lerp(border2_x, border2_xstart, a);
		border2_y = lerp(border2_y, border2_ystart, a);
		vine_y = lerp(vine_y, vine_ystart, a);
		cursor_x = lerp(cursor_x, 0, 0.05);
		cursor_y = lerp(cursor_y, 0, a);
	}
	else
	{
		fade = approach(fade, 0, 0.1);
		border1_x = lerp(border1_x, border1_xend, a);
		border1_y = lerp(border1_y, border1_yend, a);
		border2_x = lerp(border2_x, border2_xend, a);
		border2_y = lerp(border2_y, border2_yend, a);
		vine_y = lerp(vine_y, vine_yend, a);
		cursor_x = lerp(cursor_x, 20, 0.05);
		cursor_y = lerp(cursor_y, -100, a);
	}
cursor_index += 0.35;
pause_update_priests();

var prevpause = pause;
if pause && alarm[3] == -1
{
	with obj_music
	{
		fmod_event_instance_set_paused(pillarmusicID, true);
		fmod_event_instance_set_paused(panicmusicID, true);
	}
}
if pause && !instance_exists(obj_option)&& alarm[3] == -1
{
	scr_menu_getinput();
	var _dvc = obj_inputAssigner.player_input_device[0];
	key_back2 = key_back2 || key_start2;
	if backbuffer > 0
	{
		backbuffer--;
		key_back2 = false;
	}
	moveselect = -key_up2 + key_down2;
	var prevselect = selected;
	selected += moveselect;
	if selected >= array_length(pause_menu)
		selected = 0;
	else if selected < 0
		selected = array_length(pause_menu) - 1;
	if prevselect != selected
	{
		fmod_event_one_shot("event:/sfx/ui/angelmove");
		update_cursor = true;
	}
	if key_back2
	{
		selected = false;
		key_jump = true;
	}
	if key_jump
		array_get(ds_map_find_value(pause_menu_map, array_get(pause_menu, selected)), 1)();
}
scr_pauseicons_update(-1);
if (prevpause && (!pause))
	fmod_set_parameter("musicmuffle", savedmusicmuffle, 0)