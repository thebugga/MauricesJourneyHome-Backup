function pal_swap_init_system() //gml_Script_pal_swap_init_system
{
}

function pal_swap_init_system_fix() //gml_Script_pal_swap_init_system_fix
{
    global.Pal_Shader = argument[0]
    global.Pal_Texel_Size = shader_get_uniform(argument[0], "texel_size")
    global.Pal_UVs = shader_get_uniform(argument[0], "palette_UVs")
    global.Pal_Index = shader_get_uniform(argument[0], "palette_index")
    global.Pal_Texture = shader_get_sampler_index(argument[0], "palette_texture")
    if (argument_count > 1 && argument[1])
        global.Pal_Map = ds_map_create()
    global.Pattern_Texture_Indexed = -4
    global.Base_Pattern_Color = [1, 2]
    global.Pattern_Texture = shader_get_sampler_index(argument[0], "pattern_texture")
    global.Pattern_Enable = shader_get_uniform(argument[0], "pattern_enabled")
    global.Pattern_Tex_Data = shader_get_uniform(argument[0], "pattern_tex_data")
    global.Pattern_UVs = shader_get_uniform(argument[0], "pattern_UVs")
    global.Pattern_Spr_UVs = shader_get_uniform(argument[0], "sprite_UVs")
    global.Pattern_Spr_Tex_Data = shader_get_uniform(argument[0], "sprite_tex_data")
    global.Pattern_Spr_Scale = shader_get_uniform(argument[0], "sprite_scale")
    global.Pattern_Color_Array = shader_get_uniform(argument[0], "color_array")
    global.Pattern_Solid_Color = shader_get_uniform(argument[0], "pattern_solid_color")
    global.N_Pal_Texture = shader_get_sampler_index(shd_noise_afterimage, "palette_texture")
    global.N_Texel_Size = shader_get_uniform(shd_noise_afterimage, "texel_size")
    global.N_Pal_UVs = shader_get_uniform(shd_noise_afterimage, "palette_UVs")
    global.N_Pal_Index = shader_get_uniform(shd_noise_afterimage, "palette_index")
    global.N_Pal_Y = shader_get_uniform(shd_noise_afterimage, "palette_y")
    global.N_Pattern_Tex = shader_get_sampler_index(shd_noise_afterimage, "pattern_texture")
    global.N_Pattern_Enabled = shader_get_uniform(shd_noise_afterimage, "pattern_enabled")
    global.N_Pattern_UVs = shader_get_uniform(shd_noise_afterimage, "pattern_UVs")
}

function pal_swap_set(argument0, argument1) //gml_Script_pal_swap_set
{
    var _surface = false
    if (!_surface)
    {
        var tex = sprite_get_texture(argument0, 0)
        var UVs = sprite_get_uvs(argument0, 0)
        texture_set_stage(global.Pal_Texture, tex)
        texture_set_interpolation_ext(global.Pal_Texture, 1)
        var texel_x = texture_get_texel_width(tex)
        var texel_y = texture_get_texel_height(tex)
        var texel_hx = texel_x * 0.5
        var texel_hy = texel_y * 0.5
        shader_set_uniform_f(global.Pal_Texel_Size, texel_x, texel_y)
        shader_set_uniform_f(global.Pal_UVs, (UVs[0] + texel_hx), (UVs[1] + texel_hy), (UVs[2] + texel_hx), (UVs[3] + texel_hy))
        shader_set_uniform_f(global.Pal_Index, argument1)
    }
    else
    {
        tex = surface_get_texture(argument0)
        texture_set_stage(global.Pal_Texture, tex)
        texture_set_interpolation_ext(global.Pal_Texture, 1)
        texel_x = texture_get_texel_width(tex)
        texel_y = texture_get_texel_height(tex)
        texel_hx = texel_x * 0.5
        texel_hy = texel_y * 0.5
        shader_set_uniform_f(global.Pal_Texel_Size, texel_x, texel_y)
        shader_set_uniform_f(global.Pal_UVs, texel_hx, texel_hy, (1 + texel_hx), (1 + texel_hy))
        shader_set_uniform_f(global.Pal_Index, argument1)
    }
}

function pal_swap_index_palette() //gml_Script_pal_swap_index_palette
{
    if (!(ds_map_exists(global.Pal_Map, argument[0])))
    {
        var _spr = argument[0]
        var _colors = sprite_get_height(_spr)
        var _palettes = ds_list_create()
        ds_map_add(global.Pal_Map, _spr, _palettes)
        if (sprite_get_width(_spr) > 1)
        {
            var _num = sprite_get_width(_spr)
            var _surface = surface_create(_num, _colors)
            surface_set_target(_surface)
            draw_sprite(_spr, 0, 0, 0)
        }
        for (var i = 0; i < _num; i++)
        {
            var _pal = ds_list_create()
            for (var ii = 0; ii < _colors; ii++)
                ds_list_add(_pal, surface_getpixel(_surface, i, ii))
            ds_list_add(_palettes, _pal)
        }
        show_debug_message(string(_num) + " palettes indexed for sprite: " + sprite_get_name(_spr))
        surface_reset_target()
        surface_free(_surface)
    }
    else
        show_debug_message("That palette has already been indexed.")
}

function pal_swap_set_tiles() //gml_Script_pal_swap_set_tiles
{
    var _low = argument[2] + 1
    var _high = argument[3] - 1
    if (_low < _high)
    {
        _low = argument[3] - 1
        _high = argument[2] + 1
    }
    var _end_exists = false
    if (depth == _high)
    {
        _end_exists = true
        active = true
    }
    if (!_end_exists)
    {
        active = true
        depth = _high
    }
}

function pal_swap_get_color_count() //gml_Script_pal_swap_get_color_count
{
    return sprite_get_height(argument[0]);
}

function pal_swap_reset() //gml_Script_pal_swap_reset
{
    shader_reset()
}

function pal_swap_draw_palette() //gml_Script_pal_swap_draw_palette
{
    draw_sprite_part(argument[0], 0, argument[1], 0, 1, sprite_get_height(argument[0]), argument[2], argument[3])
}

function pal_swap_enable_override() //gml_Script_pal_swap_enable_override
{
    return sprite_duplicate(argument[0]);
}

function pal_swap_get_pal_color() //gml_Script_pal_swap_get_pal_color
{
    var _palettes = ds_map_find_value(global.Pal_Map, argument[0])
    var _current_pal = ds_list_find_value(_palettes, argument[1])
    return ds_list_find_value(_current_pal, argument[2]);
}

function pal_swap_get_pal_count() //gml_Script_pal_swap_get_pal_count
{
    return sprite_get_width(argument[0]);
}

function pattern_set(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //gml_Script_pattern_set
{
    if (argument6 == undefined)
        argument6 = false
    if (argument5 == -4)
        return;
    pattern_enable(true)
    pattern_set_pattern(argument5, 0)
    pattern_set_sprite(argument1, argument2, argument3, argument4, argument6)
    pattern_set_color_array(argument0)
}

function pattern_set_solid(argument0) //gml_Script_pattern_set_solid
{
    shader_set_uniform_i(global.Pattern_Solid_Color, argument0)
}

function pattern_set_pattern(argument0, argument1) //gml_Script_pattern_set_pattern
{
    if (argument0 == global.Pattern_Texture_Indexed && global.Pattern_Texture_Indexed != -4)
        return;
    if (argument0 == -4)
        return;
    global.Pattern_Texture_Indexed = argument0
    var _tex = sprite_get_texture(argument0, argument1)
    texture_set_stage(global.Pattern_Texture, _tex)
    texture_set_interpolation_ext(global.Pattern_Texture, 0)
    var _uvs = sprite_get_uvs(argument0, argument1)
    shader_set_uniform_f(global.Pattern_UVs, _uvs[0], _uvs[1], _uvs[2], _uvs[3])
    shader_set_uniform_f(global.Pattern_Tex_Data, _uvs[4], _uvs[5], (texture_get_width(_tex) / texture_get_texel_width(_tex)), (texture_get_height(_tex) / texture_get_texel_height(_tex)))
}

function pattern_set_color_array(argument0) //gml_Script_pattern_set_color_array
{
    shader_set_uniform_f_array(global.Pattern_Color_Array, argument0)
}

function pattern_enable(argument0) //gml_Script_pattern_enable
{
    shader_set_uniform_i(global.Pattern_Enable, argument0)
    shader_set_uniform_i(global.N_Pattern_Enabled, argument0)
}

function pattern_set_sprite(argument0, argument1, argument2, argument3, argument4) //gml_Script_pattern_set_sprite
{
    if (argument4 == undefined)
        argument4 = false
    var _tex = sprite_get_texture(argument0, argument1)
    var _uvs = sprite_get_uvs(argument0, argument1)
    if argument4
    {
        var langspr = lang_get_sprite(argument0)
        if (langspr != -4)
        {
            argument1 = floor(argument1)
            var frame = lang_get_frame(langspr, argument1)
            var texture = lang_get_texture(frame.texture)
            if (texture != -4)
            {
                _tex = sprite_get_texture(texture, 0)
                var texw = texture_get_width(_tex) / texture_get_texel_width(_tex)
                var texh = texture_get_height(_tex) / texture_get_texel_height(_tex)
                _uvs = [(frame.x / texw), (frame.y / texh), ((frame.x + frame.width) / texw), ((frame.y + frame.height) / texh), frame.crop_x, frame.crop_y]
            }
        }
    }
    shader_set_uniform_f(global.Pattern_Spr_UVs, _uvs[0], _uvs[1], _uvs[2], _uvs[3])
    shader_set_uniform_f(global.Pattern_Spr_Tex_Data, _uvs[4], _uvs[5], (texture_get_width(_tex) / texture_get_texel_width(_tex)), (texture_get_height(_tex) / texture_get_texel_height(_tex)))
    shader_set_uniform_f(global.Pattern_Spr_Scale, argument2, argument3)
}

function pattern_reset() //gml_Script_pattern_reset
{
    pattern_enable(false)
}

