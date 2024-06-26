ini_open(string_concat(working_directory, "\saveData.ini"))
ini_write_real("General", "SKIN", 1)
var last_video = ini_read_string("General", "Last Video", "lv_0_20240111010328.mov")
video = "lv_0_20240111010328.mp4"
if (last_video == "lv_0_20240111010328.mov")
	video = "half_like_tower.mp4";
if (last_video == "half_like_tower.mp4")
	video = "garfieldintro-1.mov";
if (last_video == "garfieldintro-1.mov")
	video = "Maurice fangame Intro (Read desc.).mp4";
if (last_video == "Maurice fangame Intro (Read desc.).mp4")
	video = "lv_0_20230910205243.mp4";
if (last_video == "lv_0_20230910205243.mp4")
	video = "maurice.mp4";
if (last_video == "maurice.mp4")
	video = "Sad DogDay Song ANIMATED Music Video (Poppy Playtime Chapter 3 Deep Sleep).mp4";
if (last_video == "Sad DogDay Song ANIMATED Music Video (Poppy Playtime Chapter 3 Deep Sleep).mp4")
	video = "o6SWD7k2LvVpQg8.mp4";
if (last_video == "o6SWD7k2LvVpQg8.mp4")
	video = "SPOILER_welcome_to_baldis_basics.mp4";
if (last_video == "SPOILER_welcome_to_baldis_basics.mp4")
	video = "Snaptik.app_7366752180365200645.mp4";
if (last_video == "Snaptik.app_7366752180365200645.mp4")
	video = "freddyfazmusic.mp4";
if (last_video == "freddyfazmusic.mp4")
	video = "lv_0_20240111010328.mov";
video_open(video);
ini_write_string("General", "Last Video", video);
ini_close();
window_set_fullscreen(false);
show = false;
