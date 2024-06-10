function scr_maurice_titlescreen(){
movespeed = 0;
xscale = 1;
move = 0;
hsp = 0;
vsp  = 0;
yscale = 1;
debug = false;
censormode = false;
scr_characterspr()
depth = -100;
taunt_delay = 0;
saved_sprite = sprite_index;
saved_imagespeed = image_speed;
saved_hsp = hsp;
saved_vsp = vsp;
saved_movespeed = movespeed;
taunted = false;
}