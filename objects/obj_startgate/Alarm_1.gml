if showingstage > 4
{
	if showingstage < 6
	{
		showingstage++
		alarm[1] = 40
		if showingstage == 6
			alarm[2] = 60
	}
}
else
{
	if goochling[showingstage] == 1
	{
		goochlingscale[showingstage] = 2
		alarm[1] = 15
	}
	else
	alarm[1] = 1
	showingstage++
}