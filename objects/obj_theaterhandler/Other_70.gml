var _type = async_load[? "type"]
if (_type == "video_end")
{
    video_close()
	video_open(video_array[irandom(array_length(video_array) - 1)])
}