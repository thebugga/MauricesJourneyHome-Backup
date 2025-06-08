function set_globals()
{
	randomize();
	global.RandomSeed = random_get_seed();
	ini_open("globalsave.ini")
	global.fullscreen = ini_read_real("options", "fullscreen", false)
	global.master_volume = ini_read_real("options", "master_volume", 1)
	global.sfx_volume = ini_read_real("options", "sfx_volume", 1)
	global.music_volume = ini_read_real("options", "music_volume", 1) //these being global are kinda unneccesary...
	ini_close()
	
	window_set_fullscreen(global.fullscreen)
	audio_master_gain(global.master_volume)
	audio_group_set_gain(ag_sfx, global.sfx_volume, 0)
	audio_group_set_gain(ag_music, global.music_volume, 0)
	
	pal_swap_init_system(shd_pal_swapper)
	
	global.CoopGame = false;
	global.SwapMode = false;
	
	global.fartcounter = 0;
	global.doorindex = 0;
	
	global.goochcash = 0
	
	global.cutscene = {
		garbage: -4,
		wizard: -4,
		elevator1: -4,
		elevator2: -4,
		bomb: -4,
		doise1: -4,
		dougie1: -4,
	}
	
	global.combo = {
		count: 0,
		timer: 0,
		record: 0,
		font: font_add_sprite_ext(spr_combo_font, "0123456789", true, 2),
		wasted: false
	}
	
	pal_swap_init_system(shd_pal_swapper, shd_pal_swapper, shd_pal_swapper) //cool
	global.ds_save_room = ds_list_create()
	global.ds_escapesaveroom = ds_list_create()
	global.ds_saveroom = ds_list_create()
	global.doorshut = false
	global.levelattempts = 0;
	global.scorefont = font_add_sprite_ext(spr_font_collect, "0123456789", true, 0)
	global.generic_font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ!¡¿?.1234567890:ÁÄÃÀÂÉÈÊËÍÎÏÓÖÕÔÚÙÛÜÇ", true, 0)
	global.creditsfont = font_add_sprite_ext(spr_creditsfont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz.:!¡0123456789?'\"ÁÄÃÀÂÉÈÊËÍÌÎÏÓÖÕÔÒÚÙÛÜáäãàâéèêëíìîïóöõôòúùûüÇç_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнльœ«»+ß", true, 2);
	global.smallfont = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ!¡.:?¿1234567890ÁÄÃÀÂÉÈÊËÍÌÎÏÓÖÕÔÒÚÙÛÜÇ+", 1, 0)
    global.tutorialfont = font_add_sprite_ext(spr_tutorialfont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz!¡,.:0123456789'?¿-áäãàâæéèêëíìîïóöõôòúùûüÿŸÁÄÃÀÂÉÈÊËÍÌÎÏÓÖÕÔÒÚÙÛÜÇçœß;«»+", 1, 2)
	global.smallerfont = font_add_sprite_ext(spr_smallerfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!._1234567890:?", 1, -2)
	global.hud_negativefont = font_add_sprite_ext(spr_negativenumber_font, "0123456789$-", true, 0)
	global.smallnumberfont = font_add_sprite_ext(spr_smallnumber_font, "1234567890-+", true, 0)
	global.secret = false
	global.boss_room = false
	set_rank_milestones(1000, 500, 250, 125)
	
	global.level_data = {
		treasure: false,
		level_name: "Entrance",
		secret_count: 0,
		goochlings: [0, 0, 0, 0, 0],
		tauntcount: 0
	}
	
	
	global.keybinds = {}
	
	var bind_arr = [
		["left",		vk_left],
		["right",		vk_right],
		["up",			vk_up],
		["down",		vk_down],
		["jump",		ord("Z")],
		["grab",		ord("X")],
		["dash",		vk_shift],
		["taunt",		ord("C")],
		["ui_left",		vk_left],
		["ui_right",	vk_right],
		["ui_up",		vk_up],
		["ui_down",		vk_down],
		["ui_accept",	ord("Z")],
		["ui_deny",		vk_escape]
	]
	
	ini_open("globalsave.ini")
	
	for (var i = 0; i < array_length(bind_arr); i++) 
	{
		var bindname = bind_arr[i][0]
		var defaultbind = bind_arr[i][1]
		var key = ini_read_real("keybinds", bindname, defaultbind)
	    struct_set(global.keybinds, bindname, key)
	}
	
	ini_close()
	gml_release_mode(false);
	global.showcollisions = true
	global.savefile = 1
}
