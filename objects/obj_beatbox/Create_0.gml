scr_initenemy()
vsp = -11
depth = -3
snd = fmod_createEventInstance("event:/sfx/misc/breakdancemusic")
fmod_event_set3DPosition(snd, x, y)
fmod_studio_event_instance_start(snd)
event_play_oneshot_3d("event:/sfx/misc/breakdance", obj_player1.x, obj_player1.y)
/*if global.playerCharacter == Characters.Doise
    sprite_index = spr_beatboxN
*/