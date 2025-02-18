{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "fmod_gms",
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": -1,
  "extensionVersion": "0.0.1",
  "packageId": "",
  "productId": "",
  "author": "",
  "date": "2025-01-26T13:49:11.1609357-05:00",
  "license": "",
  "description": "",
  "helpfile": "",
  "iosProps": false,
  "tvosProps": false,
  "androidProps": false,
  "html5Props": false,
  "installdir": "",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"fmod-gamemaker.dll","filename":"fmod-gamemaker.dll","origname":"","init":"","final":"","kind":1,"uncompress":false,"functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_init","externalName":"FMOD_Init","kind":1,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_destroy","externalName":"FMOD_Destroy","kind":1,"help":"","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_bank_load","externalName":"FMOD_Bank_Load","kind":1,"help":"","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_load","externalName":"FMOD_Event_Load","kind":1,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_update","externalName":"FMOD_Update","kind":1,"help":"","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_create_instance","externalName":"FMOD_Event_CreateInstance","kind":1,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_play","externalName":"FMOD_EventInstance_Play","kind":1,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_stop","externalName":"FMOD_EventInstance_Stop","kind":1,"help":"","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_release","externalName":"FMOD_EventInstance_Release","kind":1,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_3d_attributes","externalName":"FMOD_EventInstance_Set3DAttributes","kind":1,"help":"","hidden":false,"returnType":2,"argCount":3,"args":[
            2,
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_set_listener_attributes","externalName":"FMOD_SetListenerAttributes","kind":1,"help":"","hidden":false,"returnType":2,"argCount":3,"args":[
            2,
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_set_num_listeners","externalName":"FMOD_SetNumListeners","kind":1,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_parameter","externalName":"FMOD_EventInstance_SetParameter","kind":1,"help":"","hidden":false,"returnType":2,"argCount":4,"args":[
            2,
            1,
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_get_parameter","externalName":"FMOD_EventInstance_GetParameter","kind":1,"help":"","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_set_parameter","externalName":"FMOD_SetParameter","kind":1,"help":"","hidden":false,"returnType":2,"argCount":3,"args":[
            1,
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_get_parameter","externalName":"FMOD_GetParameter","kind":1,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_paused","externalName":"FMOD_EventInstance_SetPaused","kind":1,"help":"","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_get_paused","externalName":"FMOD_EventInstance_GetPaused","kind":1,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_paused_all","externalName":"FMOD_EventInstance_SetPaused_All","kind":1,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_one_shot","externalName":"FMOD_Event_OneShot","kind":1,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_one_shot_3d","externalName":"FMOD_Event_OneShot_3D","kind":1,"help":"","hidden":false,"returnType":2,"argCount":3,"args":[
            1,
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_is_playing","externalName":"FMOD_EventInstance_IsPlaying","kind":1,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_get_timeline_pos","externalName":"FMOD_EventInstance_GetTimelinePosition","kind":1,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_timeline_pos","externalName":"FMOD_EventInstance_SetTimelinePosition","kind":1,"help":"","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_bank_load_sample_data","externalName":"FMOD_Bank_LoadSampleData","kind":1,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_get_length","externalName":"FMOD_Event_GetLength","kind":1,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"documentation":"",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":3026418971067809998,"usesRunnerInterface":false,"order":[],},
  ],
  "HTML5CodeInjection": "",
  "classname": "",
  "tvosclassname": null,
  "tvosdelegatename": null,
  "iosdelegatename": "",
  "androidclassname": "",
  "androidcodeinjection": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidPermissions": [],
  "androidProps": false,
  "androidsourcedir": "",
  "author": "",
  "classname": "",
  "copyToTargets": -1,
  "date": "2025-01-26T15:49:11.1609357-03:00",
  "description": "",
  "exportToGame": true,
  "extensionVersion": "0.0.1",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"fmod-gamemaker.dll","constants":[],"copyToTargets":3026418971067809998,"filename":"fmod-gamemaker.dll","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_init","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_Init","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_destroy","argCount":0,"args":[],"documentation":"","externalName":"FMOD_Destroy","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_bank_load","argCount":2,"args":[
            1,
            2,
          ],"documentation":"","externalName":"FMOD_Bank_Load","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_load","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_Event_Load","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_update","argCount":0,"args":[],"documentation":"","externalName":"FMOD_Update","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_create_instance","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_Event_CreateInstance","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_play","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_Play","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_stop","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_Stop","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_release","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_Release","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_3d_attributes","argCount":3,"args":[
            2,
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_Set3DAttributes","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_set_listener_attributes","argCount":3,"args":[
            2,
            2,
            2,
          ],"documentation":"","externalName":"FMOD_SetListenerAttributes","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_set_num_listeners","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_SetNumListeners","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_parameter","argCount":4,"args":[
            2,
            1,
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_SetParameter","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_get_parameter","argCount":2,"args":[
            2,
            1,
          ],"documentation":"","externalName":"FMOD_EventInstance_GetParameter","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_set_parameter","argCount":3,"args":[
            1,
            2,
            2,
          ],"documentation":"","externalName":"FMOD_SetParameter","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_get_parameter","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_GetParameter","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_paused","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_SetPaused","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_get_paused","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_GetPaused","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_paused_all","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_SetPaused_All","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_one_shot","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_Event_OneShot","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_one_shot_3d","argCount":3,"args":[
            1,
            2,
            2,
          ],"documentation":"","externalName":"FMOD_Event_OneShot_3D","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_is_playing","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_IsPlaying","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_get_timeline_pos","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_GetTimelinePosition","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_timeline_pos","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_SetTimelinePosition","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_bank_load_sample_data","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_Bank_LoadSampleData","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_get_length","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_Event_GetLength","help":"","hidden":false,"kind":1,"returnType":2,},
      ],"init":"","kind":1,"order":[],"origname":"","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject": "",
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "HTML5CodeInjection": "",
  "html5Props": false,
  "IncludedResources": [],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "",
  "ioscodeinjection": "",
  "iosdelegatename": "",
  "iosplistinject": "",
  "iosProps": false,
  "iosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "license": "",
  "maccompilerflags": "",
  "maclinkerflags": "",
  "macsourcedir": "",
  "options": [],
  "optionsFile": "options.json",
  "packageId": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
  "productId": "",
  "sourcedir": "",
  "supportedTargets": -1,
  "tvosclassname": null,
  "tvosCocoaPodDependencies": "",
  "tvosCocoaPods": "",
  "tvoscodeinjection": "",
  "tvosdelegatename": null,
  "tvosmaccompilerflags": "",
  "tvosmaclinkerflags": "",
  "tvosplistinject": "",
  "tvosProps": false,
  "tvosSystemFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
}