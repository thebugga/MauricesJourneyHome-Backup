if (global.panic == true && global.fill > 0 && (!instance_exists(obj_ghostcollectibles)) && (!global.tutorial_room))
    global.fill -= 0.2
if (global.fill <= 0 && global.panic && (!global.tutorial_room) && (!instance_exists(obj_pizzamancer)))
{
	instance_create(obj_player1.x, obj_player1.y, obj_pizzamancer)
    event_play_oneshot("event:/sfx/pizzamancer/laugh")
}
if (global.fill <= 0)
    global.fill = 0
