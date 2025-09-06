surface_free(doise_blood_surf)
doise_blood_surf = surface_create(room_width, room_height)

depth = layer_get_depth(layer_get_id("Instances")) + 50