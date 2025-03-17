enum tvprompt
{
	normal,
	trigger,
	transfo
}

combo_state = 0;
combo_posX = 0;
combo_vsp = 0;
combo_posY = 0;
combofill_x = 0;
combofill_y = 0;
combofill_index = 0;
combobubblevisible = true;
comboend = false;
image_speed = 0.1
chose = 0
messagelist = ds_list_create()
showtext = 0
tvprompts_list = ds_list_create()
state = states.normal
newsy = 0
promptx = SCREEN_WIDTH
headline = ""
prompt = ""
promptspd = 1
prompt_buffer = 0
prompt_max = 150
tvsurface = surface_create(278, 268)
targetgolf = -4
special_prompts = -4
hud_posx = 0
hud_posY = 0
noisebuffer = 14
noiseindex = 0
expressionsprite = -4
expressionbuffer = 0
golfsurf = -4
tv_bg_index = 0
tvsprite = spr_tv_idle
cardboardsprite = -4
cardboardvisual = -4
cardboardexprsprite = -4
cardboardy = 402
sprite_index = spr_tv_off
jetpack_x = 1014
bubbleindex = 0
bubblespr = -4
idleanim = 180
xi = 500
yi = 600
imageindexstore = 0
once = 0
global.hurtcounter = 0
global.hurtmilestone = 3
alpha = 1
shownranka = 0
shownrankb = 0
shownrankc = 0
global.srank = 0
global.arank = 0
global.brank = 0
global.crank = 0
character = "PEPPINO"
display_set_gui_size(960, 540)
chunkmax = 0
timer_x = -sprite_get_width(spr_timer_bar)
timer_y = SCREEN_HEIGHT - sprite_get_height(spr_timer_bar)
pizzaface_sprite = spr_timer_pizzaface1
pizzaface_index = 0
johnface_sprite = spr_timer_lysiaface
johnface_index = 0
bar_surface = -4
barfill_x = 0
showtime_buffer = 0
