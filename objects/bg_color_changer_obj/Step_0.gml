/// @description Changes bg color lol
r += irandom_range(-1, 1) + bias;
g += irandom_range(-1, 1) + bias;
b += irandom_range(-1, 1) + bias;
if((r+g+b) > 600 || (r+g+b) < 400) {
	bias *= -1;
}
var new_color = make_colour_rgb(r, g, b);
layer_background_blend(bg_id, new_color);