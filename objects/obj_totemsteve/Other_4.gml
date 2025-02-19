if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy()
if (global.snickchallenge == 1)
	instance_destroy()
var totes = 0
do
	totes++
until !asset_get_index(concat("spr_hungrypillar", totes+1))
for (var i = 0; i < image_yscale; i++)
{	
	totem_face[i] = irandom_range(1, totes)
	totem_index[i] = 0
}