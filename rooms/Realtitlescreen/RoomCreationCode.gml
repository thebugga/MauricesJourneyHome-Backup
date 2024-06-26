global.seconds = 10
global.minutes = 0
global.mach_color1 = make_colour_rgb(0, 0, 255);
global.mach_color2 = make_colour_rgb(0, 255, 0);
global.afterimage_color1 = make_colour_rgb(0, 0, 255);
global.afterimage_color2 = make_colour_rgb(0, 255, 0);
global.smallnumber_color1 = make_colour_rgb(255, 255, 255);
global.smallnumber_color2 = make_colour_rgb(248, 0, 0);
global.panic = false
global.coop = false
global.taunt_delay = 20;
global.collect = 0;
obj_player.state = states.titlescreen
obj_player.visible = false
pal_swap_init_system(shd_pal_swapper);
window_set_fullscreen(true)
window_enable_borderless_fullscreen(true)
pal_swap_init_system_fix(shd_pal_swapper)
var data_arr = [(get_save_folder() + "/saveData1.ini"), (get_save_folder() + "/saveData2.ini"), (get_save_folder() + "/saveData3.ini")]
for (var i = 0; i < array_length(data_arr); i++)
{
    ini_open(data_arr[i])
    if (i == 0)
        global.percentage_1 = ini_read_real("Game", "percent", 0)
    else if (i == 1)
        global.percentage_2 = ini_read_real("Game", "percent", 0)
    else if (i == 2)
        global.percentage_3 = ini_read_real("Game", "percent", 0)
    global.game_started[i] = ini_read_real("Tutorial", "finished", false)
    global.game_judgement[i] = ini_read_string("Game", "finalrank", "none")
    global.game_tim[i] = ini_read_real("Game", "tim", false)
    global.game_carl[i] = ini_read_real("Game", "finalcarl", false)
    global.game_palette[i] = ini_read_real("Game", "palette", 1)
    var _texture = ini_read_string("Game", "palettetexture", "none")
    global.game_palettetexture[i] = scr_get_texture_palette(_texture)
    ini_close()
}
global.longintro = true;
if (global.longintro)
{
	global.longintro = false;
	room_goto(titscreen2);
}
else
	room_goto(titscreen);
input_game_init()