var lay_id = layer_get_id("Foregrounds_Ground2");
var lay_id2 = layer_get_id("Effect_escape");
if global.panic.active
{
    layer_set_visible(lay_id, true);
    layer_set_visible(lay_id2, true);
}
else
{
    layer_set_visible(lay_id, false);
    layer_set_visible(lay_id2, false);
}

