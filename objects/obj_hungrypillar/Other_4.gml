if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy()
if (global.snickchallenge == 1)
	instance_destroy()
for (var i = 0; i < image_yscale; i++)
{	
	totem_face[i] = irandom_range(1, 2)
	totem_index[i] = 0
}