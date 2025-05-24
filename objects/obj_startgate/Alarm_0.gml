if showingstage > 4
{
	if showingstage < 6
	{
		showingstage++
		alarm[0] = 40
		if showingstage == 6
			alarm[1] = 60
	}
}
else
{
	if save_data.goochling[showingstage]
	{
		goochlingscale[showingstage] = 2
		alarm[0] = 15
	}
	else
	alarm[0] = 1
	showingstage++
}