enum tvprompt
{
	normal,
	trigger,
	transfo
}

image_speed = 0.1
chose = 0
messagelist = ds_list_create()
showtext = 0
tvprompts_list = ds_list_create()
state = states.normal
promptxstart = 641
promptx = promptxstart
prompt = ""
promptspd = 1
prompt_buffer = 0
prompt_max = 150
promptsurface = surface_create(290, 102)
tvsurface = surface_create(278, 268)
targetgolf = -4
special_prompts = -4
hud_posx = 0
hud_posY = 0
noisemax = 14
noisebuffer = noisemax
noiseindex = 0
expressionsprite = -4
expressionbuffer = 0
golfsurf = -4
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
noisesprite = spr_noiseHUD_idle
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
collect_shake = 0
global.srank = 0
global.arank = 0
global.brank = 0
global.crank = 0
character = "PEPPINO"
display_set_gui_size(960, 540)
chunkmax = 0
timer_xstart = 327
timer_ystart = 464
timer_x = timer_xstart
timer_y = (timer_ystart + 212)
pizzaface_sprite = spr_timer_pizzaface1
pizzaface_index = 0
johnface_sprite = spr_timer_johnface
johnface_index = 0
hand_sprite = spr_timer_hand1
hand_index = 0
bar_surface = -4
barfill_x = 0
showtime_buffer = 0
rank_state = 0
rank_visual = 0
previousrank = 0;
rank_x = 50
rank_newx = -50
rank_xscale = 1
rank_yscale = 1
rank_clip = -4
rank_surf = -4
rankbg_color = ds_map_create()
ds_map_set(rankbg_color, 0, #283040)
ds_map_set(rankbg_color, 1, #086800)
ds_map_set(rankbg_color, 2, #003088)
ds_map_set(rankbg_color, 3, #800000)
ds_map_set(rankbg_color, 4, #D07800)
ds_map_set(rankbg_color, 5, #882858)
ds_map_set(rankbg_color, 6, #882858)
