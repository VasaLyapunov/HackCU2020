/// @description Spooky logic

// Reset attack timer
if(attack_timer <= 0)
	attack_timer = irandom_range(20,55);

if(attacking) {
	sprite_index = enemy1_attack_spr;
}
else if (dying) {
	sprite_index = enemy1_die_spr;
}
else {
	// Attack stance if close
	var distance = distance_to_object(player_obj);
	if(distance < 80) {
		sprite_index = enemy1_idle_spr;
		attack_timer--;
		if(attack_timer <= 0) {
			attacking = true;
			image_index = 0;
		}
	}
	// Move if not close
	else {
		sprite_index = enemy1_walk_spr;
		// Hor collision
		var h_spd = h_dir * walk_spd;
		if(place_meeting(x+h_spd, y, ground_parent_obj)) {
			while(!place_meeting(x+h_dir, y, ground_parent_obj)) {
				x = x + h_dir;
			}
			h_spd = 0;
			h_dir *= -1;
			image_xscale = image_xscale * -1;
		}
		x = x + h_spd;
	}
}
