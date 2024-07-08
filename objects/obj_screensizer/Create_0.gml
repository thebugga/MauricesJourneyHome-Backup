window_set_size(960, 540)
surface_resize(application_surface, 960, 540)
camera_set_view_size(view_camera[0], 960, 540)
var_windowsizes = [
[480, 270],
[960, 540],
[1440, 810],
[1920, 1080]
]
ini_open("saveData.ini")
window_set_fullscreen(ini_read_real("Option", "fullscreen", 0))
window_set_size(var_windowsizes[ini_read_real("Option", "resolution", 1)][0], var_windowsizes[ini_read_real("Option", "resolution", 1)][1])
window_center()
ini_close()