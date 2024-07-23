if (!fadedin || fadeout)
	fadealpha = Approach(fadealpha, 1, 0.1)
else
	fadealpha = Approach(fadealpha, 0, 0.1)
if (fadealpha == 1)
	fadedin = true
image_index = titlecardi
if titlestate == 1
{
	if !titlecredit[2]
		titlealpha = Approach(titlealpha, 0, 0.1)
	layoutalpha = Approach(layoutalpha, 1, 0.1)
	if titlecredit[3]
		disclaimeralpha = Approach(disclaimeralpha, 1, 0.1)
}
if titlestate == 2
{
	layoutalpha = Approach(layoutalpha, 0, 0.1)
	artalpha = Approach(artalpha, 1, 0.1)
}
if titlestate == 3
{
	artalpha = Approach(artalpha, 0, 0.1)
	musicalpha = Approach(musicalpha, 1, 0.1)
}
