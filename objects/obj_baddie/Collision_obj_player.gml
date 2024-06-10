if (instance_exists(baddieID) && instance_exists(obj_baddie.baddieID))
{
	{
		var lag = room_speed * 3;
		baddieID.hitLag = lag;
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_baddiegibs);
		instance_create(x, y, obj_baddiegibs);
		instance_create(x, y, obj_baddiegibs);
		with obj_cam
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
		instance_destroy(baddieID);
	}
}
