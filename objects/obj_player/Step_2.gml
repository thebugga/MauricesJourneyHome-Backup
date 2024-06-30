var pal = player_index
paletteselect = player_paletteselect[pal]
global.palettetexture = player_patterntexture[pal]
player_paletteindex = pal
if (global.collect != global.lastcollect)
{
    var diff = global.collect - global.lastcollect
    global.lastcollect = global.collect
    if global.swapmode
        global.collect_player[player_index] += diff
}
