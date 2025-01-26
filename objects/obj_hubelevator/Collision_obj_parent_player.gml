if (state == states.normal && other.grounded && other.key_up2 && global.elevatorcutscene1)
{
	state = states.titlescreen
	playerid = other.id
	other.key_up2 = 0
    other.sprite_index = other.spr_lookdoor
    other.target_room = -4
    other.image_index = 0
    other.state = states.door
}
