with (obj_camera)
{
    shake_mag = 4
    shake_mag_acc = (3 / room_speed)
}
obj_player1.y -= 25
obj_player1.state = states.slipbanan
obj_player1.visible = true
obj_player1.movespeed = 10
obj_player1.vsp = -10
instance_destroy()