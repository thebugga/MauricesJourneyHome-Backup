if sprite_index == spr_checkpoint
{
	reset_anim(spr_checkpoint_activation)
	event_play_oneshot("event:/sfx/misc/checkpoint")
	other.xstart = self.x
	other.ystart = self.y
}
