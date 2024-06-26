scr_collision_init()
input_init();
enum states
{
	normal,
	jump,
	mach,
	mach3,
	nickel,
	runwall,
	move,
	hurt,
	door,
	titlescreen,
	debugstate,
	slide,
	roll,
	actor,
	punch
}
xscale = 1;
idle = 0
mach4mode = false;
launch = false;
steppybuffer = 0;
flash = false;
dashcloudid = obj_blank;
global.palettetexture = -4;
usepalette = true
global.comboscore = 0
global.savedcomboscore = 0
global.stylethreshold = false
global.kungfu = false
hallway = 0
hallwaydirection = 0
macheffect = false;
scale_xs = 1;
scale_ys = 1;
angle = 0;
paletteselect = 4;
toomuchalarm1 = 0;
spr_palette = spr_mauricepalette
move = 0;
coyote_time = 0;
yscale = 1;
debug = false;
censormode = false;
target_door = "A"
baddieID = 0;
target_room = noone
image_speed = 0.4;
character = "M"
depth = -100;
global.taunt_delay = 0;
saved_sprite = sprite_index;
saved_imagespeed = image_speed;
saved_hsp = hsp;
saved_vsp = vsp;
taunted = false;
hallway = false;
savedhallway = false;
hallwaydirection = 0;
savedhallwaydirection = 0;
vhallwaydirection = 0;
savedvhallwaydirection = 0;
verticalhallway = false;
savedverticalhallway = false;
box = false;
movespeed = 0
grav = 0.4
xscale = 1
yscale = 1
state = states.normal;
image_speed = 0.35
machshit = 0
can_jump = false;
buffer_counter = 0
buffer_max = 8
input_buffer_jump = 8
input_buffer_secondjump = 8
input_buffer_highjump = 8
input_buffer_walljump = 0
input_buffer_slap = 8
input_attack_buffer = 0
input_finisher_buffer = 0
input_up_buffer = 0
input_down_buffer = 0
terminalVelocity = 20
pepperman_accel = 0.25
pepperman_deccel = 0.5
pepperman_accel_air = 0.15
pepperman_deccel_air = 0.25
pepperman_maxhsp_normal = 6
pepperman_jumpspeed = 11
pepperman_grabID = -4
shoulderbash_mspeed_start = 12
shoulderbash_mspeed_loop = 10
shoulderbash_jumpspeed = 11
saved_movespeed = movespeed;
scr_characterspr()

