init_collide()
state = states.normal
funnyangle = 0

stunned = false
stunnedbuffer = 0
jugglecount = 0
bouncetimes = 3

team = 0

prev = {
	lag: 0,
	state: self.state,
	x: self.x,
	y: self.y,
	hsp: self.hsp,
	vsp: self.vsp,
	sprite_index: self.sprite_index,
	image_index: self.image_index,
}

movespeed = 0
prevframe = 0
landAnim = false
invincible = false

player_index = -1;
character = 5
scr_bosscharacterspr();
spr_idle = spr_boss_september
play_id = -4
pattern_init()

HP = 500
HP_max = 500
SP = 0

input_text = ""