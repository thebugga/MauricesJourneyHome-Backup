pattern_init()
event_play_oneshot("event:/sfx/ui/tvswitch")
event_play_oneshot_3d("event:/sfx/player/groundpound", obj_player.x, obj_player.y)
image_speed = 0.35
sprite_index = spr_techdiff_static
depth = -999
state = 0
t_ix = 0
