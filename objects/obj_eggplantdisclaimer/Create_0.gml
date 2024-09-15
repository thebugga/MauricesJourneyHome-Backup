ini_open(string_concat(working_directory, "\saveData.ini"))
ini_write_real("General", "SKIN", 1)
video = "intro.mp4";
video_open(video);
ini_write_string("General", "Last Video", video);
ini_close();
scr_initinput();
show = false;