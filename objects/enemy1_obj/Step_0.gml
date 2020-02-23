/// @description 


var h_spd = h_dir * walk_spd;

// -- Movement

// Hor collision
if(place_meeting(x+h_spd, y, ground1_obj)) {
	while(!place_meeting(x+h_dir, y, ground1_obj)) {
		x = x + h_dir;
	}
	h_spd = 0;
	h_dir = -h_dir;
	image_xscale = image_xscale * -1;
}
x = x + h_spd;

// Vert collision
if(place_meeting(x, y+v_spd, ground1_obj)) {
	while(!place_meeting(x, y+sign(v_spd), ground1_obj)) {
		y = y + sign(v_spd);
	}
	v_spd = 0;
}
y = y + v_spd;