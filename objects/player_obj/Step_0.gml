/// @description Main player game logic

// Fullscreen on F11
if (keyboard_check_pressed(vk_f11)) {
    window_set_fullscreen(!window_get_fullscreen());
}

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

h_dir = (key_right - key_left);
var h_spd = h_dir * walk_spd;
v_spd = v_spd + grav_acc;
//Change rooms
if(x > room_width-sprite_width){
	if(global.rightRoomIndex >= 0){
		room_goto(global.rightRoomIndex);
		x=0;
	}
	else{
		
		x=room_width-sprite_width;
	}
}
if(x < 0){
	if(global.leftRoomIndex >= 0){
		room_goto(global.leftRoomIndex);
		x=room_width-sprite_width;
	}
	else{
		x=0
	}
}
if(y > room_height-sprite_height){
	if(global.downRoomIndex >= 0){
		room_goto(global.downRoomIndex);
		y=0;
	}
	else{
		
		y=room_height-sprite_height;
	}
}
if(y < 0){
	show_debug_message(string(global.upRoomIndex));
	if(global.upRoomIndex >= 0){
		room_goto(global.upRoomIndex);
		y=room_height-sprite_height;
	}
	else{
		y=0
	}
}

// Grab possible collisions
cEnemy = place_meeting(x + h_spd, y, enemy1_obj);

// Interact with enemies
if (cEnemy || place_meeting(x, y, enemy1_obj)) {
	if (!enemy_collided) {
		hp -= 1;
		show_debug_message(hp)
	}
	
	enemy_collided = true;
}

else {
	enemy_collided = false;
}


// -- Movement

// Jumping
var started_jump = false;
if place_meeting(x, y+1, ground1_obj) && key_jump && !animation_interrupt {
    v_spd = jump_spd;
    started_jump = true;
}    

// Hor collision
if(place_meeting(x+h_spd, y, ground1_obj) || cEnemy) {
    while(!place_meeting(x+h_dir, y, ground1_obj) && !place_meeting(x + h_dir, y, enemy1_obj)) {
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