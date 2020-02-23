/// @description Handles returning to idle after finishing certain animations
// You can write your code in this editor

if (sprite_index == player_swrd_drw_spr) {
    sword_out = true;
    animation_interrupt = false;
}

if (sprite_index == player_swrd_shte_spr) {
    sword_out = false;
    animation_interrupt = false;
}

if (sprite_index == player_jump_spr) {
    if (in_air) {
        sprite_index = player_fall_spr;
        image_index = 0;
    }
    else {
        animation_interrupt = false;
    }
}

if (sprite_index == player_fall_spr && !in_air) {
    animation_interrupt = false;
}