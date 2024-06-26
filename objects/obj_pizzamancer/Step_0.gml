var playerid = obj_player1;

	mancer_attributes = {
	position: {x: obj_pizzamancer.x, y: obj_pizzamancer.y, z: 0},
	velocity: {x: obj_pizzamancer.x, y: obj_pizzamancer.y, z: 0},
	forward: {x:obj_pizzamancer.x,y:obj_pizzamancer.y,z:1.0},
	up: {x:obj_pizzamancer.x,y:1.0,z:0},
	}
laugh_ref = fmod_studio_system_get_event("event:/sfx/pizzaface/laugh")
laugh = fmod_studio_event_description_create_instance(laugh_ref);
fmod_studio_event_instance_set_3d_attributes(laugh, mancer_attributes);
if (!fmod_studio_event_instance_start(laugh))
	fmod_studio_event_instance_start(laugh);
snd_ref = fmod_studio_system_get_event("event:/sfx/pizzaface/moving")
snd = fmod_studio_event_description_create_instance(snd_ref);
fmod_studio_event_instance_set_3d_attributes(snd, mancer_attributes);
if (!fmod_studio_event_instance_start(snd))
	fmod_studio_event_instance_start(snd);
if (!instance_exists(playerid))
	exit;
var _move = true;
if !_move
	image_alpha = Approach(image_alpha, 0, 0.1);
if maxspeed < 3 && image_alpha >= 1
	maxspeed += 0.01;
if !treasure
{
	if image_alpha >= 1
	{
		if (!instance_exists(obj_fadeout))
		{
			if _move
			{
				var dir = point_direction(x, y, playerid.x, playerid.y);
				x += lengthdir_x(maxspeed, dir);
				y += lengthdir_y(maxspeed, dir);
			}
		}
	}
	else
		image_alpha += 0.01;
}
else
{
	x = -200;
	y = -200;
}
