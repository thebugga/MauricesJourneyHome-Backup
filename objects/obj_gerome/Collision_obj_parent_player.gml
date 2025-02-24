if global.panic 
{
   ds_list_add(global.saveroom, id)
   global.gerome = true
   fmod_event_one_shot_3d("event:/sfx/voice/geromegot", x, y)
   global.combotime = 60
   instance_create(x, y, obj_geromefollow)
   instance_create_unique(0, 0, obj_lap2visual);
   instance_create(x, y, obj_baddietaunteffect)
   instance_destroy()
   global.laps++
   global.lap = true
   global.collect += 3000;
   global.combotime = 60;
   with (instance_create(x, y, obj_smallnumber))
      number = string(3000);
}
else
{
    event_inherited()
}