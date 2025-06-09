image_speed = 0.35
selected = [0, 0]
ready = [0, 0]
stopper = false
character[0] = ["MAURICE", p_characters.maurice, spr_player_exitdoor, spr_player_timesup]
character[1] = ["PIERRE", p_characters.pierre, spr_pierre_idle, spr_pierre_escapepoint]
character[2] = ["THE UNDOISED", p_characters.undoised, spr_playerD_idle, spr_playerD_idle]
character[3] = ["MANDREK", p_characters.mandrek, spr_mandrek_walk, spr_mandrek_skid]
p1_sprite = spr_player_exitdoor
p1_index = 0
p2_sprite = spr_playerD_idle
p2_index = 0
p1_boxheight = 440
p2_connect = global.multiplayer != multiplayer_mode.none
multimode = global.multiplayer == multiplayer_mode.swapmode
multialpha = 0
finger1_index = 0
finger2_index = 0
control_timer[0] = irandom(100)
control_timer[1] = irandom(100)
control_scale[0] = 2
control_scale[1] = 2
mode_scale = 1
switch_index = 0