pause = 0
i = 0
color = make_color_rgb(121, 103, 151)
player1 = -4
player2 = -4
selected = 0
stickpressed = 0
image_speed = 0
depth = -998
savedmusicmuffle = 0
pause_menu = ["pause_resume", "pause_options", "pause_restart", "pause_exit", "pause_credits"]
cursor_index = 0
cursor_sprite_number = sprite_get_number(spr_angelpriest)
cursor_sprite_height = sprite_get_height(spr_angelpriest)
cursor_x = -1000
cursor_y = -1000
fade = 0
fadein = 0
screensprite = -4
screensize = 0
guisprite = -4
instance_list = ds_list_create()
priest_list = ds_list_create()
start = 0
alarm[1] = 1

wiping = false
wipe_surface = surface_create(SCREEN_WIDTH, SCREEN_HEIGHT)
wipe_array = []
for (var i = 0; i < SCREEN_WIDTH; i++)
{
	array_push(wipe_array, [0, 0, irandom(20)])
}

start_wiping = function()
{
	scr_delete_pause_image()
	scr_create_pause_image()
	surface_set_target(wipe_surface)
	scr_draw_pause_image()
	surface_reset_target()
	var mixer = 3
	for (var i = 0; i < SCREEN_WIDTH; i++)
	{
		var val = irandom_range(-2, 2)
		mixer += val
		if mixer < 0 || mixer > 20
			mixer -= val
		wipe_array[i] = [0, 0, mixer]
	}
	wiping = true
}

pause_menu_map = ds_map_create();
ds_map_set(pause_menu_map, "pause_resume", [0, function()
{
	scr_pause_activate_objects();
	instance_destroy(obj_option);
	instance_destroy(obj_keyconfig);
}]);
ds_map_set(pause_menu_map, "pause_options", [1, function()
{
	fmod_event_one_shot("event:/sfx/ui/select");
	with (instance_create(x, y, obj_option))
		depth = other.depth - 1;
}]);
ds_map_set(pause_menu_map, "pause_restart", [2, function()
{
	start_wiping()
	if !global.snickchallenge
	{
		var rm = global.leveltorestart;
		if rm != noone && rm != -1
		{
			alarm[5] = 1;
			roomtorestart = rm;
			scr_pause_activate_objects();
			instance_destroy(obj_option);
			instance_destroy(obj_keyconfig);
			pause = false;
		}
		else
			fmod_event_one_shot("event:/sfx/ui/select");
	}
}]);
var exit_function = function()
{
	start_wiping()
	instance_destroy(obj_option);
	instance_destroy(obj_keyconfig);
	fmod_event_instance_stop(global.snd_bossbeaten, true);
	savedmusicmuffle = fmod_get_parameter("musicmuffle")
	fmod_set_parameter("musicmuffle", 0, 0)
	var sl = ds_list_create();
	var il = ds_list_create();
	var arr = -4;
	ds_list_copy(sl, sound_list);
	ds_list_copy(il, instance_list);
	if global.leveltorestart != noone
	{
		gamesave_async_save();
		hub = true;
		arr = ["hubgroup"];
		global.startgate = false;
		global.leveltorestart = noone;
	}
	else
	{
		hub = false;
		arr = ["menugroup"];
	}
	ds_list_add(il, id);
	with (textures_offload(arr))
	{
		ds_list_clear(sound_list);
		ds_list_clear(instance_list);
		ds_list_copy(sound_list, sl);
		ds_list_copy(instance_list, il);
		pause = true;
		pauseID = other.id;
	}
	instance_deactivate_object(id);
	ds_list_destroy(sl);
	ds_list_destroy(il);
};
ds_map_set(pause_menu_map, "pause_exit", [3, exit_function]);
ds_map_set(pause_menu_map, "pause_exit_title", [3, exit_function]);
ds_map_set(pause_menu_map, "pause_credits", [4, function()
{
	fmod_event_one_shot("event:/sfx/ui/select");
	with (instance_create(x, y, obj_manual))
		depth = other.depth - 1;
}]);

cursor_index = 0;
cursor_sprite_number = sprite_get_number(spr_angelpriest);
cursor_sprite_height = sprite_get_height(spr_angelpriest);
cursor_x = -1000;
cursor_y = -1000;
cursor_actualx = 0;
cursor_actualy = 0;
update_cursor = false;
hub = true;
treasurefound = false;
treasurealpha = 0;
secretcount = 0;
secretalpha = 0;
transfotext = -4;
transfotext_size = 0;
roomtorestart = -4;
savedsecretpause = false;
savedmusicpause = false;
savedpillarpause = false;
savedpanicpause = false;
savedkidspartypause = false;
fade = 0;
fadein = false;
screensprite = -4;
screensize = 0;
guisprite = -4;
instance_list = ds_list_create();
sound_list = ds_list_create();
priest_list = ds_list_create();
start = false;
pause_icons = array_create(0);
scr_pauseicon_add(spr_pauseicons, 0, -20, -12);
scr_pauseicon_add(spr_pauseicons, 1, 5, -15);
scr_pauseicon_add(spr_pauseicons, 2, -10);
scr_pauseicon_add(spr_pauseicons, 3, -10);
scr_pauseicon_add(spr_pauseicons, 4, -10);
scr_pauseicon_add(spr_pauseicons, 8, 0, -12);
alarm[1] = 1;

