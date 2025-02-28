if (other.instakillMove or other.state == states.handstandjump)
{
	with (other)
	{
		scr_pummel()
		instance_destroy(other)
	}
}
