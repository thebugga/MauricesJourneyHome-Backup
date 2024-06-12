scr_collision_init()
scr_initinput();
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
}
xscale = 1;
idle = 0
hallway = 0
hallwaydirection = 0
move = 0;
yscale = 1;
debug = false;
censormode = false;
target_door = "A"
baddieID = 0;
target_room = noone
image_speed = 0.4;
character = "M"
depth = -100;
taunt_delay = 0;
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
buffer_counter = 0
buffer_max = 8
terminalVelocity = 20
saved_movespeed = movespeed;
scr_characterspr()

