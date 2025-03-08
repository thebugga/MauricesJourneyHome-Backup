depth = -108;
hsp = 0;
vsp = 0;
fake_y = y;
random_max = 300;
random_random = 120;
savedx = x;
savedy = y;
savedcx = camera_get_view_x(view_camera[0]);
savedcy = camera_get_view_y(view_camera[0]);
random_buffer = random_max + irandom_range(-(random_random + 1), random_random);

content[0] = obj_cheeseslime;
content[1] = obj_forknight;
content[6] = obj_robot;
content[7] = obj_swedishmonkey;
content[8] = obj_coolpineapple;
content[9] = obj_ancho;

snd = fmod_createEventInstance("event:/sfx/pizzaface/moving");

function bonehurtingjuice()
{
    with (obj_player1)
    {
        if ((state == states.ghostpossess || state == states.titlescreen || state == states.mort) && cutscene == 0)
        {
        }
        else if (state == states.tacklecharge && hurted == 0)
        {
        }
        else if (state == states.transitioncutscene)
        {
        }
        else if (state == states.tumble || state == states.ejected)
        {
        }
        else if (state != states.shotgundash && hurted == 0 && cutscene == 0 && state != states.shotgunshoot && state != states.ladder)
        {
            global.hurtcounter += 1
            alarm[8] = 30
            alarm[7] = 60
            hurted = 1
            if (xscale == other.image_xscale)
                sprite_index = spr_hurtjump
            else
                sprite_index = spr_hurt
            movespeed = 8
            vsp = -5
            timeuntilhpback = 300
            if (global.collect > 100)
                global.collect -= 100
            else
                global.collect = 0
            if (global.collect != 0)
            {
                instance_create(x, y, obj_pizzaloss)
                instance_create(x, y, obj_pizzaloss)
                instance_create(x, y, obj_pizzaloss)
                instance_create(x, y, obj_pizzaloss)
                instance_create(x, y, obj_pizzaloss)
                instance_create(x, y, obj_pizzaloss)
                instance_create(x, y, obj_pizzaloss)
                instance_create(x, y, obj_pizzaloss)
                instance_create(x, y, obj_pizzaloss)
                instance_create(x, y, obj_pizzaloss)
                instance_create(x, y, obj_pizzaloss)
                instance_create(x, y, obj_pizzaloss)
            }
            else if (obj_player1.shotgunAnim == 1)
                obj_player1.shotgunAnim = 0
            instance_create(x, y, obj_spikehurteffect)
            state = states.hurt
            image_index = 0
            flash = 1
            global.style -= 15
        }
    }
}

