do
ds_queue_clear(followqueue)
until ds_queue_empty(followqueue)
space = 0
x = playerid.x
y = playerid.y
lastplayerposx = x
lastplayerposy = y