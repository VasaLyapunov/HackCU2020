/// @description Changes bg color lol
timeout--;
if(timeout == 2) {
	r += irandom_range(-2, 2) + bias;
	g += irandom_range(-2, 2) + bias;
	b += irandom_range(-2, 2) + bias;
	if(r<0)
		r = 0
	else if(r>255)
		r = 255
	if(b<0)
		b = 0
	else if(b>255)
		b = 255
	if(g<0)
		g = 0
	else if(g>255)
		g = 255
	
	if((r+g+b) > 600 || (r+g+b) < 500) {
		bias *= -1;
	}
	new_color = make_colour_rgb(r, g, b);
}
else if(timeout == 0) {
	layer_background_blend(bg_id, new_color);
	timeout = 3;	
}