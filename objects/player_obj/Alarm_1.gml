/// @description Insert description here
// You can write your code in this editor

if (i_frame) {
	if (alpha_track % 2 == 0) {
		image_alpha = 0.3;
	}
	
	else {
		image_alpha = 0.7;
	}
	alpha_track++;
	alarm[1] = room_speed * 0.5;
}

else {
	image_alpha = 1
}


	
