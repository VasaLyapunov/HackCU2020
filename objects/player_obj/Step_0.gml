/// @description Main player game logic

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

h_dir = (key_right - key_left);
var h_spd = h_dir * walk_spd;
v_spd = v_spd + grav_acc;

// -- Movement

// Jumping
if(key_jump) {
	v_spd = jump_spd;
}	

// Hor collision
if(place_meeting(x+h_spd, y, ground1_obj)) {
	while(!place_meeting(x+h_dir, y, ground1_obj)) {
		x = x + h_dir;
	}
	h_spd = 0;
}
x = x + h_spd;

// Vert collision
var in_air = 0;
if(place_meeting(x, y+v_spd, ground1_obj)) {
	while(!place_meeting(x, y+sign(v_spd), ground1_obj)) {
		y = y + sign(v_spd);
	}
	v_spd = 0;
}
else {
	in_air = 1;
}
y = y + v_spd;


// -- Animation
if(h_dir == 0 || in_air) {
	image_speed=0;
	if(h_dir == 0) {
		image_index = 0;	
	}
	else {
		image_index = 1;	
	}
}
else {
	image_speed=2;	
}


