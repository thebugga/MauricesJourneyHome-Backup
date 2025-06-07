state = 0
logoalpha = 1
depth = -100
global.savefile = -1

menuselect = 0
menu = [["PLAY", function() {
	state = 2
}
], ["OPTIONS", function() {
	instance_create(x, y, obj_options)
}
], ["CREDITS", function() {
	instance_create(x, y, obj_manual)
}
], ["JOIN THE DISCORD!", function() {
	url_open("https://discord.gg/nhkT69y52P")
}
], ["QUIT", function() {
	state = 3
}
]]
saveselect = 1
character = [new menu_character_inst(0.5, 1.5, 0.5, 0.8, 
	spr_titlepep_forward, spr_titlepep_righttomiddle, spr_titlepep_lefttomiddle, spr_titlepep_forwardtoleft, spr_titlepep_middle, 
	false, "", p_characters.maurice), new menu_character_inst(0.25, -0.5, 0.25, 0, 
	spr_menutv1_selected, spr_menutv1_whitenoise, spr_menutv1_whitenoise, spr_menutv1_whitenoise, spr_menutv1_confirm, 
	false, "", -1), new menu_character_inst(1.25, 0.5, 0.75, 0.5,
	spr_player_idle, spr_player_idledance, spr_player_idlewhat, spr_player_idlebite, spr_player_scared, 
	false, "", -1)]
percvisual = 0
perstatus_icon = 0
	
function menu_character_inst(_inx, _iny, _outx, _outy, _spridle, _spranim1, _spranim2, _spranim3, _sprselect, _saveneed, _savename, _characternumb) constructor
{
	sprite = _spridle
	index = 0
	x = screen_w * _inx
    y = screen_h * _iny
	sprite_set = {
			idle: _spridle,
			anim1: _spranim1,
			anim2: _spranim2,
			anim3: _spranim3,
			select: _sprselect,
		}
	timer = irandom(250)
	saveneeded = _saveneed
	savename = _savename
	in_x = _inx
	in_y = _iny
	out_x = _outx
	out_y = _outy
	character = _characternumb
	if character <= 0
	{
		pattern_init()
		pal_ix = 0
		pat_spr = -4
	}
}
depth = -100
