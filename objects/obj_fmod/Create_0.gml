#region init system
var _channels = 256
var _coreflags = FMOD_INIT.NORMAL;
var _studioflags = FMOD_STUDIO_INIT.LIVEUPDATE;

#macro USE_DEBUG_CALLBACKS false

if (USE_DEBUG_CALLBACKS) {
    fmod_debug_initialize(FMOD_DEBUG_FLAGS.LEVEL_ERROR, FMOD_DEBUG_MODE.CALLBACK);
}

fmod_studio_system_create();    
show_debug_message("fmod_studio_system_create: " + string(fmod_last_result()));

fmod_studio_system_init(_channels, _studioflags, _coreflags);
show_debug_message("fmod_studio_system_init: " + string(fmod_last_result()));

system = fmod_studio_system_get_core_system();
#endregion
#region load banks
var banks = [
  "Master.strings.bank",
  "Master.bank",
  "music.bank",
  "sfx.bank"
];
for (var i = 0; i < array_length(banks); i++) {
    var b = (working_directory + banks[i]);
    var bank = fmod_studio_system_load_bank_file(b, FMOD_STUDIO_LOAD_BANK.NORMAL);
    show_debug_message(concat("Loaded ", banks[i], ": ", string(fmod_last_result())));
    fmod_studio_bank_load_sample_data(bank);
    show_debug_message(concat("Sample data for ", banks[i], ": ", string(fmod_last_result())));
}
#endregion
#region 3D Settings
global.FMOD_default3DAttributes = {
    position: {x: 0, y: 0, z: 0}, //listener pos
    velocity: {x: 0, y: 0, z: 0}, //dont use
    forward: {x: 0, y: 0, z: 1}, //where forward is (into the screen)
    up: {x: 0, y: 1, z: 0}, //where up is (y axis)
}

attributes3D = global.FMOD_default3DAttributes;

attributes3D.position = {
    x: (960 / 2), //update in step to match camera position
    y: (540 / 2), //this one too
    z: 0 //if you really want to, go for it
}

fmod_studio_system_set_num_listeners(1);
fmod_studio_system_set_listener_attributes(0, attributes3D);
fmod_studio_system_set_listener_weight(0, 1.0);
#endregion