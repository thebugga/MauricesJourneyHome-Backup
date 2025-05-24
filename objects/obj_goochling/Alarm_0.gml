global.score += 1000

var c = {
	sprite_index: self.sprite_index,
	image_index: self.image_index,
	x: self.x - obj_camera.campos.x,
	y: self.y - obj_camera.campos.y,
	val: 1000
}
array_push(obj_collect_got_visual.collects, c)

instance_destroy()