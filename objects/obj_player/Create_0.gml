collide_init()
debugstats = false;

enum p_characters
{
    maurice,
    pierre,
    undoised,
	mandrek,
	/*
    clownmato,
    orange,
    swag,
    gabbie,
    peppino
	*/
}

transformation_list = ds_list_create()
ds_list_add(transformation_list, states.wizard, states.wizardgrapple, states.wizarddash, states.wizardcling)
ds_list_add(transformation_list, states.ball, states.fireass)

player = 0
character = p_characters.maurice
scr_character_spr()
spawn = "a"
door_type = fade_types.none
wasclimbingwall = false
coyote_time = 0
movespeed = 0
state = states.normal
//exitdoor properties
state = states.actor
sprite_index = spr_exitdoor
image_speed = 0.35
//the end
prevstate = states.normal
xscale = 1
rotation = 0
jumpstop = false
doublejump = false
mach4mode = false
slaphand = 0
sjumper = false
sjumptimer = 0
sjumpangle = 270
wallspeed = 0
flash = 0

mandrek_jumpstartspeed = 0
mandrek_floored = true

timeup_anglediff = 0
timeup_angle = 0
timeup_dist = 0

aftimg_timers = {
	mach: {timer: 0, effect: after_images.mach, resetpoint: 5, do_it: false},
	blur: {timer: 0, effect: after_images.blur, resetpoint: 2, do_it: false}
}

/*ptcl_timers = {
	bleh: 0
} what was this again?*/

dir = 0
freefallsmash = 0
crouchslipbuffer = 0
grabclimbbuffer = 0
ladderbuffer = 0

overwriteanim = -4
overwriteindex = 0

has_pistol = false
pistolcooldown = 0
pistolcharge = 0
pistolchargeshooting = false

prev = {
	room: room,
	state: self.state,
	hsp: self.hsp,
	vsp: self.vsp,
	sprite_index: self.sprite_index,
	image_index: self.image_index,
}

breakdance_secret = {
	index: 0,
	buffer: 0,
	spd: 0.1
}

visual_size = 1
secret_exit = false
secret_cutscene = false
idletimer = 120
instakill = false
taunttimer = 0
i_frames = 0
particle_timer = 0
flamecloud_buffer = 0
haskey = false
hasgerome = false
fallingtimer = 0
didgroundpound = false
depth = -100

pal_select = 1
pattern_spr = pat_gomer
hat_spr = -4

pattern_init()

input_buffers = {
	jump: 0,
	grab: 0
} //fuck it, ill just do it in the player step

return_location = {
	room: 0,
	x: 0,
	y: 0
}
restart_location = {
	room: 0,
	door: 0,
	title: 0,
	name: ""
}

doorxscale = 1
warping = false
hitstun = 0
supertauntcount = 0
supertauntshow = false
supertauntbuffer = 0
myemitter = noone
multiholder = -4

wizardclingtimer = 300
wizardthrowangle = 90

machsnd = fmod_createEventInstance("event:/sfx/player/mach");
fmod_studio_event_instance_set_parameter_by_name_multiplatform(machsnd, "state", 0, true);
machrollsnd = fmod_createEventInstance("event:/sfx/player/machroll");
knightslidesnd = fmod_createEventInstance("event:/sfx/knight/slide");
ratmountballsnd = fmod_createEventInstance("event:/sfx/ratmount/ball");
ratmountgroundpoundsnd = fmod_createEventInstance("event:/sfx/ratmount/groundpound");
ratmountpunchsnd = fmod_createEventInstance("event:/sfx/ratmount/punch");
freefallsnd = fmod_createEventInstance("event:/sfx/player/freefall");
snd_voiceok = fmod_createEventInstance("event:/sfx/voice/ok");
snd_voicetransfo = fmod_createEventInstance("event:/sfx/voice/transfo");
snd_voiceouttransfo = fmod_createEventInstance("event:/sfx/voice/outtransfo");
snd_voicehurt = fmod_createEventInstance("event:/sfx/voice/hurt");
global.snd_escaperumble = fmod_createEventInstance("event:/sfx/misc/escaperumble");
global.snd_rankup = fmod_createEventInstance("event:/sfx/ui/rankup");
global.snd_pizzafacemoving = fmod_createEventInstance("event:/sfx/pizzaface/moving");
global.snd_rankdown = fmod_createEventInstance("event:/sfx/ui/rankdown");
global.snd_rank = fmod_createEventInstance("event:/music/rank");
global.snd_slidersfx = fmod_createEventInstance("event:/sfx/ui/slidersfx");
global.snd_slidermusic = fmod_createEventInstance("event:/sfx/ui/slidermusic");
global.snd_slidermaster = fmod_createEventInstance("event:/sfx/ui/slidersfxmaster");
global.snd_bossbeaten = fmod_createEventInstance("event:/sfx/misc/bossbeaten");
superjumpholdsnd = -1;
superjumpprepsnd = -1;
superjumpsnd = fmod_createEventInstance("event:/sfx/player/superjump");
suplexdashsnd = fmod_createEventInstance("event:/sfx/player/suplexdash");