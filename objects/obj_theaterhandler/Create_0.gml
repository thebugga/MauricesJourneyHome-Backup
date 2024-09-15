video_array = array_create(0)
find_videos("videos/")
video_open(video_array[irandom(array_length(video_array) - 1)])
video_set_volume(0)