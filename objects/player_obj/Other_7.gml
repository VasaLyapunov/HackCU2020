/// @description Handles returning to idle after finishing certain animations
// You can write your code in this editor

if (sprite_index == player_swrd_drw_spr || sprite_index == player_attack1_spr || sprite_index == player_attack2_spr || sprite_index == player_attack3_spr) {
    sword_out = true;
    animation_interrupt = false;
}

if (sprite_index == player_swrd_shte_spr) {
    sword_out = false;
    animation_interrupt = false;
}

if (sprite_index == player_jump_spr || sprite_index == player_air_attack1_spr || sprite_index == player_air_attack2_spr) {
	if (sprite_index == player_air_attack1_spr || sprite_index == player_air_attack2_spr) {
		sword_out = true;
	}
	
    if (in_air) {
        sprite_index = player_fall_spr;
        image_index = 0;
    }
    else {
        animation_interrupt = false;
    }
}

if (sprite_index == player_air_attack3_end_spr) {
	sword_out = true;
	animation_interrupt = false;
}

if (sprite_index == player_fall_spr && !in_air) {
    animation_interrupt = false;
}
else if (sprite_index == player_air_attack3_loop_spr && !in_air) {
	sprite_index = player_air_attack3_end_spr;
	image_index = 0;
}

