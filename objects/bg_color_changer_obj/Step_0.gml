/// @description Changes bg color lol
timeout--;
if(timeout == 2) {
	r += irandom_range(-2, 2) + bias;
	g += irandom_range(-2, 2) + bias;
	b += irandom_range(-2, 2) + bias;
	if((r+g+b) > 600 || (r+g+b) < 400) {
		bias *= -1;
	}
	new_color = make_colour_rgb(r, g, b);
}
else if(timeout == 0) {
	layer_background_blend(bg_id, new_color);
	timeout = 3;	
}