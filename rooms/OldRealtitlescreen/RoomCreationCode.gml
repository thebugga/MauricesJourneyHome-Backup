enum states
{
	normal,
	revolver,
	dynamite,
	boots,
	grabbed,
	tumble,
	finishingblow,
	ejected,
	transitioncutscene,
	fireass,
	firemouth,
	mort,
	mortjump,
	mortattack,
	morthook,
	hook,
	ghost,
	ghostpossess,
	titlescreen,
	hookshot,
	tacklecharge,
	cheeseball,
	cheeseballclimbwall,
	slap,
	cheesepep,
	cheesepepstick,
	cheesepepjump,
	cheesepepfling,
	cheesepeplaunch,
	cheesepepstickside,
	cheesepepstickup,
	rideweenie,
	motorcycle,
	boxxedpep,
	boxxedpepspin,
	boxxedpepjump,
	pistolaim,
	climbwall,
	knightpepslopes,
	portal,
	secondjump,
	chainsawbump,
	handstandjump,
	lungeattack,
	lungegrab,
	dashtumble,
	gottreasure,
	knightpep,
	knightpepattack,
	knightpepbump,
	meteorpep,
	bombpep,
	bombgrab,
	bombpepside,
	bombpepup,
	grabbing,
	chainsawpogo,
	shotgunjump,
	pogo,
	stunned,
	highjump,
	chainsaw,
	facestomp,
	mach4, // doesn't even have a script
	timesup,
	machroll,
	shotgun,
	shotguncrouch,
	shotguncrouchjump,
	shotgunshoot,
	shotgundash,
	shotgunfreefall,
	pistol,
	machfreefall,
	throwing,
	slam,
	superslam,
	skateboard,
	grind,
	grab,
	punch,
	backkick,
	uppunch,
	shoulder,
	backbreaker,
	graffiti,
	bossdefeat,
	pizzathrow,
	bossintro,
	gameover,
	keyget,
	tackle,
	jump,
	ladder,
	slipnslide,
	comingoutdoor,
	smirk,
	bazooka,
	Sjump,
	victory,
	Sjumpprep,
	crouch,
	crouchjump,
	crouchslide,
	mach1,
	mach2,
	machslide,
	bump,
	hurt,
	freefall,
	hang,
	turning, // seems to be completely wiped too like mach4
	freefallland,
	door,
	barrel,
	barreljump,
	barrelclimbwall,
	barrelslide,
	current,
	boulder,
	taxi,
	runonball,
	mach3,
	freefallprep,
	Sjumpland,
	faceplant,
	rage,
	idle,
	bounce, // doesnt exist
	charge,
	pizzagoblinthrow,
	turn,
	hitceiling, // doesnt exist
	hitwall, // doesnt exist
	unknown_1, // 133
	walk,
	fall,
	land,
	hit,
	stun,
	recovery, // doesnt exist
	stomped, // doesnt exist
	chase,
	spawnenemy,
	arena,
	arenaintro,
	arenaround,
	actor,
	parry,
	golf,
	float,
	tube,
	unused_2, // 151
	policetaxi,
	shoulderbash,
	pummel,
	staggered,
	thrown,
	boss_supershoulderbash, // 157
	boss_superattackstart,
	boss_superattackcharge,
	boss_superattack,
	boss_shoulderturn,
	boss_fistmatch,
	boss_fistmatchend,
	boss_groundpunchstart,
	slipbanan,
	boss_millionpunch,
	boss_skateboardturn,
	boss_bombkick,
	boss_bombpogo,
	boss_jetpackstart,
	boss_jetpack,
	boss_jetpackcancel,
	boss_jetpackspin,
	boss_shield,
	boss_helicopterhat,
	boss_panicjump,
	boss_smokebombstart,
	boss_smokebombcrawl,
	boss_springshoes,
	boss_cardboard,
	boss_cardboardend,
	boss_mockery,
	bombdelete,
	rocket,
	rocketslide,
	gotoplayer,
	trickjump,
	totem,
	underground,
	ridecow,
	ratmount,
	ratmountjump,
	ratmountattack,
	ratmountspit,
	ratmountclimbwall,
	ratmounthurt,
	ratmountgroundpound,
	ratmountbounce,
	unused_3,
	ratmountballoon,
	ratmounttumble,
	ratmountgrind,
	ratmounttrickjump,
	ratmountskid,
	ratgrabbed,
	blockstance,
	balloon,
	debugstate,
	trashjumpprep,
	trashjump,
	trashroll,
	stringfling,
	stringjump,
	stringfall,
	noisejetpack,
	spiderweb,
	robotidle,
	robotintro,
	robotroaming,
	robotchase,
	robotinvestigate,
	robotseeking,
	flushidle,
	flushtransition,
	animatronic,
	pizzaface_moustache,
	pizzaface_mouth,
	pizzaface_eyes,
	pizzaface_nose,
	pizzaface_ram,
	pizzaface_phase2transition,
	pizzahead_look,
	pizzahead_fishing,
	unused_4,
	pizzahead_bombrun,
	pizzahead_npcthrow,
	pizzahead_portraitthrow,
	pizzahead_enguarde,
	pizzahead_sexypicture,
	pizzahead_pullinglevel,
	pizzahead_eat,
	pizzahead_surprisebox,
	pizzahead_spinningrun,
	pizzahead_spinningkick,
	pizzahead_spinningpunch,
	pizzahead_groundpunch,
	pizzahead_bigkick,
	pizzahead_slamhead,
	pizzahead_slamhead2,
	tv_whitenoise,
	tv_expression,
	playersuperattack,
	unused_5,
	jetpackjump,
	unused_6,
	unused_7,
	bee,
	unused_8,
	ratmountpunch,
	ratmountcrouch,
	ratmountladder,
	unused_9,
	unused_10,
	magnet,
	antigrav,
	secret,
	transition,
	secretenter,
	
	// noise
	machcancelstart,
	machcancel
}

enum Characters
{
	Maurice,
	Doise,
	Vigilante,
	Clownmato,
	Snick
}
pal_swap_init_system(shd_pal_swapper,shd_pal_html_sprite,shd_pal_html_surface)
global.coop = false
global.swapmode = false
global.currentsavefile = 1
global.mach_color1 = make_colour_rgb(96, 208, 72)
global.mach_color2 = make_colour_rgb(0, 104, 232)
global.afterimage_color1 = make_colour_rgb(255, 0, 0)
global.afterimage_color2 = make_colour_rgb(0, 255, 0)
global.smallnumber_color1 = make_colour_rgb(255, 255, 255)
global.smallnumber_color2 = make_colour_rgb(248, 0, 0)
global.autotile = 1
global.heatmeter = false
global.showcollisions = true
global.font_small = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!._1234567890:?", true, -2)
global.smallnumber_fnt = font_add_sprite_ext(spr_smallnumber, "1234567890-", true, 0)
global.levelcomplete = 0
global.levelcompletename = -4
global.option_sfx_volume = 4
with (obj_parent_player)
	state = states.normal
global.loadeditor = 0
room_goto(rm_logo)
instance_destroy(obj_cutscene_handler)
gamesave_async_load()
globalvar c_rainbow;
c_rainbow = make_color_hsv((room_speed/50) mod 255,255,255);

#region debug helper stuff
	// detect possibly-common unsupported runtime version
    // but like we dont need that !
	var v = "2022.0.3.99";
	//if (GM_runtime_version != v)
	//	throw string_concat("It appears you aren't using ", v, "\nPlease switch to ", v, "for this decomp to fully work.\nIf this is the latest version of PT-ex and ", v, " isn't the latest version of GameMaker, please DM wilmer2607 at discord.");
		
	var required_files = [
		"credits.txt",
		"fmod.dll",
		"fmodstudio.dll",
		"lang/english.txt",
		"sound/Desktop/Master.bank",
		"sound/Desktop/Master.strings.bank",
		"sound/Desktop/music.bank",
		"sound/Desktop/sfx.bank",
	];
	var missing_files = "";
	for (var i = 0; i < array_length(required_files); i++)
	{
		if !file_exists(required_files[i])
			missing_files += required_files[i] + "\n";
	}
	if string_length(missing_files) > 0
	{
		show_message(concat(
			"Decomp warning: The following files could not be found:\n",
			missing_files,
			"\nPlease copy them from your Pizza Tower installation",
			"\ninto the datafiles folder in the project folder"
		));
	}


#endregion debug helper stuff