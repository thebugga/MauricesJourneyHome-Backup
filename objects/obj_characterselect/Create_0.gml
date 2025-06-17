image_speed = 0.35
vals = []
repeat 4
{
	array_push(vals, {
		connected: false,
		selected: 0,
		ready: false,
		sprite: spr_player_exitdoor,
		index: 0
	})
}

vals[0].connected = true

stopper = false
character = [{
	name: "MAURICE",
	char_enum: p_characters.maurice,
	sprite_set: {
		walkforth: spr_player_exitdoor,
		choseshock: spr_player_timesup,
		palette: pal_peppino
	}
}, {
	name: "PIERRE",
	char_enum: p_characters.pierre,
	sprite_set: {
		walkforth: spr_pierre_idle,
		choseshock: spr_pierre_escapepoint,
		palette: pal_peppino
	}
}, {
	name: "THE UNDOISED",
	char_enum: p_characters.undoised,
	sprite_set: {
		walkforth: spr_playerD_idle,
		choseshock: spr_playerD_escapepoint,
		palette: pal_undoised
	}
}, {
	name: "MANDREK",
	char_enum: p_characters.mandrek,
	sprite_set: {
		walkforth: spr_mandrek_walk,
		choseshock: spr_mandrek_skid,
		palette: pal_peppino
	}
}]

p1_boxheight = 440
multialpha = 0
finger1_index = 0
finger2_index = 0
control_timer[0] = irandom(100)
control_timer[1] = irandom(100)
control_scale[0] = 2
control_scale[1] = 2
mode_scale = 1
switch_index = 0

pattern_init()