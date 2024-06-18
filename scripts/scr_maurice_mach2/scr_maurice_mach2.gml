function scr_maurice_mach()
{
    movespeed += 0.5
    hsp = xscale * movespeed
    move = key_right + key_left
        sprite_index = spr_maurice_mach
    if (sprite_index == spr_maurice_mach && (!key_run))
    {
        state = states.normal
        image_index = 0
    }
    if place_meeting((x + xscale), y, obj_solid)
        state = states.normal
    if (movespeed >= 12)
        movespeed = 12
    image_speed = 0.35
}
function scr_maurice_mach3()
{
	image_speed = 0.35
	hsp = xscale * movespeed
	if movespeed < 20 && (key_right || key_left) 
	{
		movespeed += 0.015
	}
	if key_jump2 && grounded
	{
		image_index = 0
		sprite_index = spr_mach3jump
		vsp = -9
	}
	if place_meeting(x + (1 * xscale), y, obj_solid) && (!grounded || groundedSlope)
	{
		wallspeed = movespeed
		state = states.runwall
	}
	if key_down
	{
		state = states.slide
	}
	if sprite_index == spr_walljump && image_index = 0
	{
		vsp = -9
	}
	if ((floor(image_index) == (image_number - 1) && sprite_index == spr_walljump))
	{
		sprite_index = spr_walljumpfall
	}
	if ((floor(image_index) == (image_number - 1) && sprite_index == spr_mach3jump))
	{
		sprite_index = spr_mach3
	}
	if xscale == 1 && key_left2 && grounded
	{
		image_index = 0
		image_speed = 0.25
		sprite_index = spr_mach3turn
		state = states.slide
	event_path = fmod_studio_system_get_event("event:/sfx/maurice/machslide");
	event = fmod_studio_event_description_create_instance(event_path);
	fmod_studio_event_instance_start(event);
	}
	if xscale == -1 && key_right2 && grounded
	{
		image_index = 0
		image_speed = 0.25
		sprite_index = spr_mach3turn
		state = state = states.slide
	event_path = fmod_studio_system_get_event("event:/sfx/maurice/machslide");
	event = fmod_studio_event_description_create_instance(event_path);
	fmod_studio_event_instance_start(event);
	}
	if !key_run && (sprite_index != spr_machjump || sprite_index != spr_machjumpfall) && grounded
	{
		image_index = 0 
		sprite_index = spr_idle
		state = states.normal
		y = y-8
	}
	if place_meeting_collision(x + (1 * xscale), y, par_collision) && !groundedSlope && grounded
	{
		state = states.mach
		y = y-8
		sprite_index = spr_idle
	}

	scr_taunt();
}
function scr_maurice_machslide()
{
    hsp = xscale * movespeed
    if (sprite_index == spr_mach3turn && floor(image_index) == (image_number - 1) && (key_run))
    {
        movespeed = 12
        state = states.mach
        sprite_index = spr_mach
        image_index = 0
        xscale *= -1
	}

}