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

snd = fmod_event_create_instance("event:/sfx/pizzaface/moving");
