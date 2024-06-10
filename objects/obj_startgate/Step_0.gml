

if (level == "medieval")
{
    if (distance_to_object(obj_player) < 50)
    {
        with (obj_tv)
        {
            message = "I HEAR EVERY DOOR"
            showtext = 1
            alarm[0] = 2
        }
    }
    var fadeRange = 100
    var fadeThresh = 64
    var playerDis = distance_to_object(obj_player)
    bgalpha = (((fadeThresh + fadeRange) - playerDis) / fadeRange)
    var lay_id = layer_get_id("Backgrounds_3")
    var back_id = layer_background_get_id(lay_id)
    layer_background_alpha(back_id, bgalpha)
}
if (level == "ruin")
{
    if (distance_to_object(obj_player) < 50)
    {
        with (obj_tv)
        {
            message = "PINBALL"
            showtext = 1
            alarm[0] = 2
        }
    }
    var fadeRange = 100
    var fadeThresh = 64
    var playerDis = distance_to_object(obj_player)
    bgalpha = (((fadeThresh + fadeRange) - playerDis) / fadeRange)
    var lay_id = layer_get_id("Backgrounds_4")
    var back_id = layer_background_get_id(lay_id)
    layer_background_alpha(back_id, bgalpha)
}
if (level == "dungeon")
{
    if (distance_to_object(obj_player) < 50)
    {
        with (obj_tv)
        {
            message = "MOUNT PEPPERONI"
            showtext = 1
            alarm[0] = 2
        }
    }

    var fadeRange = 100
    var fadeThresh = 64
    var playerDis = distance_to_object(obj_player)
    bgalpha = (((fadeThresh + fadeRange) - playerDis) / fadeRange)
    var lay_id = layer_get_id("Backgrounds_2")
    var back_id = layer_background_get_id(lay_id)
    layer_background_alpha(back_id, bgalpha)
}
if (level == "snickchallenge")
{
    if (distance_to_object(obj_player) < 50)
    {
        with (obj_tv)
        {
            message = "UNNOISY SPACE"
            showtext = 1
            alarm[0] = 2
        }
    }
    var fadeRange = 100
    var fadeThresh = 64
    var playerDis = distance_to_object(obj_player)
    bgalpha = (((fadeThresh + fadeRange) - playerDis) / fadeRange)
    var lay_id = layer_get_id("Backgrounds_5")
    var back_id = layer_background_get_id(lay_id)
    layer_background_alpha(back_id, bgalpha)
}

if place_meeting(x, y, obj_doorA)
	targetDoor = "A";
if place_meeting(x, y, obj_doorB)
	targetDoor = "B";
if place_meeting(x, y, obj_doorC)
	targetDoor = "C";
if place_meeting(x, y, obj_doorD)
	targetDoor = "D";
if place_meeting(x, y, obj_doorE)
	targetDoor = "E";
if place_meeting(x, y, obj_doorF)
	targetDoor = "F";
if place_meeting(x, y, obj_doorG)
	targetDoor = "G";