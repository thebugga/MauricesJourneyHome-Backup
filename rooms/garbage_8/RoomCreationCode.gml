var lay_id = layer_get_id("Effect_escape");
if global.panic.active
    layer_set_visible(lay_id, true);
else
    layer_set_visible(lay_id, false);
