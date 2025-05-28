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

add_music(mainmenu, "event:/music/title", -4, false, function(argument0, argument1)
{
    fmod_studio_event_instance_set_parameter_by_name_multiplatform(argument1, "state", 1, false);
}
)
add_music(tower_1, "event:/music/hub", "event:/music/pillarmusic", false, hub_state)
add_music(tower_2, "event:/music/hub", "event:/music/pillarmusic", false, hub_state)
add_music(garbage_1, "event:/music/w1/garbage", "event:/music/garbagesecret", false)

