with (instance_place((x + spd), y, obj_shotgun_targetblock))
    instance_destroy()
with (instance_place(x, (y - spdh), obj_shotgun_targetblock))
    instance_destroy()
with (instance_place((x + spd), y, obj_destroyable))
    instance_destroy()
var _x = x
x += (image_xscale * spd)
y += (-spdh)