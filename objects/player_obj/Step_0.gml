/// @description Main player game logic

// Fullscreen on F11
if (keyboard_check_pressed(vk_f11)) {
    window_set_fullscreen(!window_get_fullscreen());
}

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//DEBUG
if (key_right) {
    show_debug_message("Right");
}

h_dir = (key_right - key_left);
var h_spd = h_dir * walk_spd;
v_spd = v_spd + grav_acc;

// -- Movement

// Jumping
var started_jump = false;
if place_meeting(x, y+1, ground1_obj) && key_jump && !animation_interrupt {
    v_spd = jump_spd;
    started_jump = true;
}    

// Hor collision
if(place_meeting(x+h_spd, y, ground1_obj)) {
    while(!place_meeting(x+h_dir, y, ground1_obj)) {
        x = x + h_dir;
    }
    h_spd = 0;
}
if (!animation_interrupt || in_air) {
    x = x + h_spd;
}


// Vert collision
in_air = 0;
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
if (keyboard_check_pressed(ord("X")) && !animation_interrupt && !sword_out) {
    animation_interrupt = true;
    sprite_index = player_swrd_drw_spr;
}

if (keyboard_check_pressed(ord("X")) && !animation_interrupt && sword_out) {
    animation_interrupt = true;
    sprite_index = player_swrd_shte_spr;
}

if (started_jump) {
    animation_interrupt = true;
    sprite_index = player_jump_spr;
}    

if (!animation_interrupt && !in_air) {
    if (h_dir == 0) {
        if (sword_out) {
            sprite_index = player_idle2_spr;
        }
        else {
            sprite_index = player_idle1_spr;
        }
    }
    if (h_dir == 1) {
        image_xscale = sign(h_spd);
        sprite_index = player_run_spr;
    }
    else if (h_dir == -1) {
        image_xscale = sign(h_spd);
        sprite_index = player_run_spr;
    }
}