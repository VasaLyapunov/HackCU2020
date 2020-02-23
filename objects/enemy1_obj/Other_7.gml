/// @description Detects end of attack

if (sprite_index == enemy1_attack_spr) {
	attacking = false;	
}

if (sprite_index == enemy1_die_spr) {
	instance_destroy();
}
