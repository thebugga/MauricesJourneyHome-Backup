if !trapped && comeback && playerid.riderispeetzy != ispeetzy
{
	other.visible = true
	instance_create(other.x, other.y, obj_genericpoofeffect)
	instance_destroy()
}

