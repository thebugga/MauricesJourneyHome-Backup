function scr_string_width(argument0) //scr_string_width
{
    var pos = 0
    var w = 0
    var originalstr = argument0
    var str_arr = array_create(0)
    while (pos < string_length(originalstr))
    {
        if (string_copy(originalstr, pos, 2) == "\n")
        {
            array_push(str_arr, string_copy(originalstr, 1, pos))
            string_delete(originalstr, 1, pos)
            pos = 0
            if (originalstr == "")
                break;
            else
                continue
        }
        else
        {
            pos++
            continue
        }
    }
    if (array_length(str_arr) == 0)
        w = string_width(argument0)
    for (var i = 0; i < array_length(str_arr); i++)
    {
        var b = str_arr[i]
        if (string_width(b) > w)
            w = string_width(b)
    }
    return w;
}

function scr_separate_text(texts, widths = 920) //gml_Script_scr_separate_text
{
    var separation = lang_get_value("separation_map")
    separation = string_split(separation, ",")
    var _start_pos = 0
    while (scr_string_width(texts) > (widths - string_width("a")))
    {
        var _pos = _start_pos
        var _sep_pos = _pos
        var len = string_length(texts)
        var found = false
        while (_pos < len)
        {
            if scr_is_separation(string_char_at(texts, _pos), separation)
            {
                var _prev_sep_pos = _sep_pos
                _sep_pos = _pos
                if (scr_string_width(string_copy(texts, _start_pos, (_pos - _start_pos))) > (widths - string_width("a")))
                {
                    _sep_pos = _prev_sep_pos
                    _start_pos = _sep_pos
                    _pos = _start_pos
                    found = true
                    break
                }
                else
                    _pos++
            }
            else
                _pos++
        }
        if (string_char_at(texts, _sep_pos) == " ")
        {
            texts = string_delete(texts, _sep_pos, 1)
            texts = string_insert("\n", texts, _sep_pos)
        }
        else
            texts = string_insert("\n", texts, (_sep_pos + 1))
    }
    return texts;
}

function scr_is_separation(argument0, argument1) //gml_Script_scr_is_separation
{
    for (var i = 0; i < array_length(argument1); i++)
    {
        if (argument0 == argument1[i])
            return true;
    }
    return false;
}

function scr_calculate_text(argument0) //scr_calculate_text
{
    var pos = 0
    var str2 = ""
    while (pos <= string_length(argument0))
    {
        pos++
        str2 = string_insert(string_char_at(argument0, pos), str2, (string_length(str2) + 1))
        str2 = scr_separate_text(str2)
    }
    return str2;
}

function scr_calculate_height(argument0) //scr_calculate_height
{
    var str2 = scr_calculate_text(argument0)
    return string_height(str2);
}

