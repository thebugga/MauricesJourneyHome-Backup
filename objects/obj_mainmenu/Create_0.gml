scr_init_input()
state = states.backbreaker
alarm[0] = 200
flicker_buffer = 2
flicker = 1
menufade = 0
menuselect = 0
menu = [["menu_play", function() {
	state = states.transitioncutscene
	alarm[0] = 100
}
], ["menu_options", function() {
	instance_create(x, y, obj_option)
}
], ["menu_extras", function() {
	instance_create(x, y, obj_extras)
}
], ["menu_quit", function() {
	state = states.gameover
}
]]
saveselect = 1
character[0] = [true, "", 0, 270, 0, 270]
character[1] = [false, "doise1", 0, 270, 0, 270]
character[2] = [false, "", 0, 270, 0, 270]
percvisual = 0
perstatus_icon = 0