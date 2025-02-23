if fadeout
    fade = approach(fade, 0, 0.01)
else
    fade = approach(fade, 1, 0.05)
if (fade <= 0)
    instance_destroy()
