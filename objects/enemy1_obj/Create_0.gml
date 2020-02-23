/// @description Init
// You can write your code in this editor

walk_spd = 1.5;
h_dir = 1;
attack_timer = 0;
attacking = false;

// Place on nearest ground below
while(!place_meeting(x, y+1, ground1_obj)) {
	y = y + 1;
}
