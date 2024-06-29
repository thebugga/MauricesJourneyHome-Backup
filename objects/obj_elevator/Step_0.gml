if (place_meeting(x, y, obj_doorA))
	target_door = "A";
if (place_meeting(x, y, obj_doorB))
	target_door = "B";
if (place_meeting(x, y, obj_doorC))
	target_door = "C";
if (place_meeting(x, y, obj_doorD))
	target_door = "D";
if (place_meeting(x, y, obj_doorE))
	target_door = "E";
if (place_meeting(x, y, obj_doorF))
	target_door = "F";

if fadein
{
    fadealpha = Approach(fadealpha, 1, 0.1)
    if (fadealpha >= 1 && showinside == false)
    {
        
        showinside = true
        fadein = false
        alarm[0] = (trapdoor ? 400 : 600)  
    }
}
else
{
    fadealpha = Approach(fadealpha, 0, 0.1)
}
if charvely != 0
{
chary += charvely
charvely++
}
trapopen += 0.35
if floor(trapopen) >= (sprite_get_number(charsprite) - 1)
{
trapopen = 0
}
