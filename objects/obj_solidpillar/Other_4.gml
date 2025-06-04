var totes = 0
do
	totes++
until !asset_get_index(concat("spr_pillar", totes+1))
for (var i = 0; i < image_yscale; i++)
{	
	var face = irandom_range(1, totes)
	var f = {
		sprite_index: spr_pillar,
		image_index: 0,
		sprites: {
			idle: asset_get_index(concat("spr_pillar", face)),
			scared: asset_get_index(concat("spr_pillar_scared", face)),
			dead: asset_get_index(concat("spr_pillar_dead", face))
		}
	}
	array_push(totems, f)
}
if ds_list_find_index(global.ds_saveroom, id) != -1
	instance_destroy();