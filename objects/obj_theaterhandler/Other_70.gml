var _type = async_load[? "type"]
if _type == "video_end" && alarm[0] < 0
{
    video_close()
	alarm[0] = 3
}