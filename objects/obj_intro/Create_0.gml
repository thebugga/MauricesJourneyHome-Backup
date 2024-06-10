ini_open(string_concat(working_directory, "\saveData.ini"))
ini_write_real("General", "SKIN", 1)
video = "maurice.mp4";
video_open(video);
ini_write_string("General", "Last Video", video);
ini_close();
window_set_fullscreen(false);
scr_initinput();
show = false;
