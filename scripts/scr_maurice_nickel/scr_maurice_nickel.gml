//whuh?_call
function scr_maurice_nickel()
{
	image_speed = 0.35
	if (!instance_exists(obj_nickelhitbox))
		instance_create(x,y,obj_nickelhitbox)
	if (floor(image_index) == image_number - 1)
	{
		state = states.normal;
		instance_destroy(obj_nickelhitbox)
	}
}