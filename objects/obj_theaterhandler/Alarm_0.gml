if os_type == os_gxgames
	video_open("videos/intro.mp4")
else
	video_open(video_array[irandom(array_length(video_array) - 1)])
video_seek_to(0)