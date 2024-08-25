var topy = ((sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index)) / (sprite_get_height(sprite_index) / 2))
var bottomy = ((sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index)) / (sprite_get_height(sprite_index) / 2))
anglex = lengthdir_x(sprite_get_width(sprite_index) / 2, image_angle)
angley1 = lengthdir_y((sprite_get_height(sprite_index) / 6) * -topy, image_angle)
angley2 = lengthdir_y((sprite_get_height(sprite_index) / 6) * bottomy, image_angle)
image_angle += rotatspeed
