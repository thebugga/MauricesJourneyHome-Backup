part_emitter_destroy(global.particle_system, global.part_emitter);
part_system_destroy(global.particle_system);
ds_map_destroy(global.part_map);
ds_map_destroy(global.part_depth);
ds_list_destroy(global.debris_list);
ds_list_destroy(global.collect_list);
