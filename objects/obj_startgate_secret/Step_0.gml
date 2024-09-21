yoffset = Wave(-2, 2, 2, 2)
var _x = x
x = Wave((xstart - disx), (xstart + disx), time_x, 10)
y = Wave((ystart - disx), (ystart + disx), time_y, 10)
y += yoffset
if ((x - _x) < 0)
    depth = 80
else
    depth = 0
