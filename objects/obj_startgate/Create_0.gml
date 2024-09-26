targetDoor = "A"
depth = 50
level = "none"
world = 1
drawing = 0
targetDoor = "A"
msg = ""
msgy = 540
highscore = 0
highscore_yray = 0
color_array = 0
highscore_scale = 0
secret_count = 0
goochling = array_create(5, 0)
goochlingscale = array_create(5, 0)
rank = 0
rank_scale = 0
rank_angle = 365
rank_anglesp = -10
rankbg_color = ds_map_create()
ds_map_set(rankbg_color, 0, #a0b8d8)
ds_map_set(rankbg_color, 1, #c8f8a8)
ds_map_set(rankbg_color, 2, #98e8f8)
ds_map_set(rankbg_color, 3, #eaad9c)
ds_map_set(rankbg_color, 4, #f8f8a8)
ds_map_set(rankbg_color, 5, #f8a0f8)
titlecardi = -4
gateclip = surface_create(sprite_width, sprite_height)
gatesurf = surface_create(sprite_width, sprite_height)
gatebg_x = [0, 0, 0, 0, 0]
showingstage = 0