_secret = false;
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
pillarmusicID = fmod_createEventInstance("event:/music/pillarmusic");
panicmusicID = fmod_createEventInstance("event:/music/pizzatime");
panicstart = false;
/*
add_music(Mainmenu, "event:/music/title", -4, false, function(argument0, argument1)
{
    fmod_studio_event_instance_set_parameter_by_name_multiplatform(argument1, "state", 0, false);
}
)
add_music(Longintro, "event:/music/intro", -4, false, function(argument0, argument1)
{
    fmod_studio_event_instance_set_parameter_by_name_multiplatform(argument1, "state", 0, true)
}
)
add_music(tower_entrancehallway, "event:/music/hub", noone, false);
add_music(hub_tutorial1, "event:/music/tutorial", noone, false);
add_music(hub_pizzatower2complex, "event:/music/hub", noone, false);
add_music(hub_central, "event:/music/hub", noone, false);
add_music(hub_chili, "event:/music/w1/chili", noone, false);
add_music(hub_trenchlobby, "event:/music/w1/mttrench", noone, false);
add_music(wizard_1, "event:/music/w1/wizard", "event:/music/w1/wizardsecret", false, function(room, event, event_secret)
{
	var s = -1;
	switch room
	{
		case wizard_1:
		case wizard_2:
			s = 0;
			break;
		case wizard_6:
			s = 1;
			break;
	}

	if s != -1
		fmod_studio_event_instance_set_parameter_by_name_multiplatform(event, "state", s, true);
});
add_music(hub_wizardtower, "event:/music/wizard", noone, false);
add_music(garbage_1, "event:/music/w1/garbage", "event:/music/garbagesecret", false)
add_music(hub_gravesite, "event:/music/w1/garbage", -4, false)
add_music(characterselect, "event:/music/characterselect",-4, false)
*/
add_music(level_1, "event:/music/w1/garbage", -4, false)