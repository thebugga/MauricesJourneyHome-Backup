if (room == rm_editor)
	exit;
depth = 1
solid_inst = -4

with (instance_create((image_xscale > 0 ? x : x - 32), y, obj_solid))
{
	image_yscale = other.image_yscale * 2
	other.solid_inst = id
}