secret = false;
secretend = false;
pillar_on_camera = false;
prevpillar_on_camera = false;
music_map = ds_map_create();
music = noone;
savedpillarpause = false;
savedpanicpause = false;
savedmusicpause = false;
savedsecretpause = false;
savedpanicpos = 0;
savedmusicpos = 0;
exitmusic = false;
pillarmusicID = fmod_event_create_instance("event:/music/pillarmusic");
panicmusicP = fmod_event_create_instance("event:/music/pizzatime");
panicmusicN = fmod_event_create_instance("event:/music/pizzatimenoise");
panicmusicID = panicmusicP;
kidspartychaseID = fmod_event_create_instance("event:/music/w5/kidspartychase");
panicstart = false;

add_music(rm_levelselect, "event:/music/title", noone, false);
add_music(hub_outside, "event:/music/hub", noone, false);
add_music(hub_tutorial1, "event:/music/tutorial", noone, false);
add_music(hub_lobby, "event:/music/hub", noone, false);
add_music(hub_theatre, "event:/music/hub", noone, false);
add_music(wizard_1, "event:/music/wizardry", noone, false);
add_music(wizard_2, "event:/music/wizardry", noone, false);
add_music(hub_wizardtower, "event:/music/wizardry", noone, false);
add_music(garbage_1, "event:/music/graveyard", "event:/music/pillarmusic", false)
add_music(garbage_2, "event:/music/graveyard", "event:/music/pillarmusic", false)
add_music(hub_gravesite, "event:/music/graveyard", "event:/music/pillarmusic", false)
add_music(characterselect, "event:/music/characterselect", "event:/music/pillarmusic", false)

