var _destroyed = 0
if (ds_list_find_index(global.baddieroom, id) != -1)
{
    _destroyed = 1
    instance_destroy()
}
if (escape == 1 && (!_destroyed))
{
    if (escapespawnID == -4)
    {
        with (instance_create(x, y, obj_escapespawn))
        {
            baddieID = other.id
            other.escapespawnID = id
        }
        instance_deactivate_object(id)
    }
}
if (elite && object_index != obj_robot)
{
    hp += 1
    elitehp = hp
}