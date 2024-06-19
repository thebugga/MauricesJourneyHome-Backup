global.seconds = 10
global.minutes = 0
room_goto(rm_intro)
global.mach_color1 = make_colour_rgb(0, 0, 255);
global.mach_color2 = make_colour_rgb(0, 255, 0);
global.afterimage_color1 = make_colour_rgb(0, 0, 255);
global.afterimage_color2 = make_colour_rgb(0, 255, 0);
global.smallnumber_color1 = make_colour_rgb(255, 255, 255);
global.smallnumber_color2 = make_colour_rgb(248, 0, 0);
global.taunt_delay = 20;
obj_player.state = states.titlescreen
obj_player.visible = false
pal_swap_init_system_fix(shd_pal_swapper);