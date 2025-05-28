var _transfo = 0
with (other)
{
	if ds_list_find_index(transformation_list, state) != -1
	{
		if (hsp != 0)
			xscale = sign(hsp)
		movespeed = abs(hsp)
		state = states.normal
		dir = xscale
		_transfo = 1
		particle_create(x, y, particles.genericpoof)
	}
}
if _transfo
{
	event_play_oneshot("event:/sfx/player/pray")
	var p = other.id
	with (instance_create((other.x - 540), (camera_get_view_y(view_camera[0]) - 100), obj_pizzaangel))
	{
		priestID = other.id
		playerid = p
	}
	sprite_index = spr_priest_pray
	if (collect && ds_list_find_index(global.ds_save_room, id) == -1)
	{
		ds_list_add(global.ds_save_room, id)
		var value = 500
		global.score += value
		global.combo.timer = 60
		with (instance_create((x + 16), y, obj_collect_number))
			number = string(value)
		var c = {
			sprite_index: choose(spr_mushroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect),
			image_index: 0,
			x: self.x - obj_camera.campos.x + irandom_range(-60, 60),
			y: self.y - obj_camera.campos.y + irandom_range(-60, 60),
			val: value / 16
		}
		for (var i = 0; i < value; i += round((value / 16)))
			array_push(obj_collect_got_visual.collects, c)
		if onetime
        {
	        instance_destroy()
	        with instance_create(x, y, obj_enemycorpse)
				sprite_index = spr_priest_dead
		}
	}
}
