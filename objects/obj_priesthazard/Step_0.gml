Rotation += (angle_dir * angle_spd)
if (Rotation > 360)
	Rotation = 0
if (Rotation < 0)
	Rotation = 360
x = (xstart + lengthdir_x(len, Rotation))
y = (ystart + lengthdir_y(len, Rotation))
