if scene >= array_length(scene_info)
	instance_destroy()
else
{
	var current_scene = scene_info[scene]

	do
		array_push(current_scene, 0)
	until (array_length(current_scene) - 1) >= 5

	current_scene[0](current_scene[1], current_scene[2], current_scene[3], current_scene[4], current_scene[5])
}