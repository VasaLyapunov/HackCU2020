/// @description Main player game logic

// Fullscreen on F11
if (keyboard_check_pressed(vk_f11)) {
    window_set_fullscreen(!window_get_fullscreen());
}


key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

h_dir = (key_right - key_left);
h_spd = h_dir * walk_spd;
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
	if (!enemy_collided && !i_frame) {
		if (position_meeting(bbox_right, y, ground_parent_obj)) {
			h_spd -= 15;
		}
		else {
			h_spd += 15;
		}
		
		hp -= 1;
		i_frame = true;
		v_spd -= 15;
		
		alarm[0] = room_speed * 2;
		alarm[1] = room_speed * 0.5;
	}
	
	enemy_collided = true;
}

else {
	enemy_collided = false;
}


// -- Movement

// Jumping
var started_jump = false;
if place_meeting(x, y+1, ground_parent_obj) && key_jump && !animation_interrupt {
    v_spd = jump_spd;
    started_jump = true;
}    

// Hor collision
if(place_meeting(x+h_spd, y, ground_parent_obj) && !place_meeting(x, y, ground_parent_obj)) {
    while(!place_meeting(x+h_dir, y, ground_parent_obj)) {
        x = x + h_dir;
    }
	
    h_spd = 0;
}

if (!animation_interrupt || in_air) {
    x = x + h_spd;
}


// Vert collision
in_air = 0;
if(place_meeting(x, y+v_spd, ground_parent_obj) && !place_meeting(x, y, ground_parent_obj)) {
    while(!place_meeting(x, y+sign(v_spd), ground_parent_obj)) {
        y = y + sign(v_spd);
    }
    v_spd = 0;
}
else {
    in_air = 1;
}
y = y + v_spd;

// reactive collisions for sprite animations

while (position_meeting(bbox_right, y, ground_parent_obj)) { 
	if (sprite_index != player_air_attack1_spr) {
		x--;
	}
		
	else {
		x -= sprite_get_bbox_right(sprite_index) / 2 + (x - x0);
		break;
	}
}

while (position_meeting(bbox_left, y, ground_parent_obj)) {
	if (sprite_index != player_air_attack1_spr) {
		x++;
	}
		
	else {
		x += sprite_get_bbox_right(sprite_index) / 2 + (x - x0);
		break;
	}
}

while (position_meeting(x, bbox_bottom, ground_parent_obj)) {
	if (sprite_index != player_air_attack1_spr) {
		y--;
	}
		
	else {
		break;
	}
}

while (position_meeting(x, bbox_top, ground_parent_obj)) {
	if (sprite_index != player_air_attack1_spr) {
		y++;
	}
		
	else {
		break;
	}
}

if (!animation_interrupt && in_air && v_spd > 7) {
	animation_interrupt = true;
	sprite_index = player_fall_spr;
}

// -- Animation
if (keyboard_check_pressed(ord("X")) && !animation_interrupt && !sword_out) {
    animation_interrupt = true;
	image_index = 0;
    sprite_index = player_swrd_drw_spr;
}

if (keyboard_check_pressed(ord("X")) && !animation_interrupt && sword_out) {
    animation_interrupt = true;
	image_index = 0;
    sprite_index = player_swrd_shte_spr;
}

if (started_jump) {
    animation_interrupt = true;
	image_index = 0;
    sprite_index = player_jump_spr;
}

if (keyboard_check_pressed(ord("A")) && !animation_interrupt) {
	animation_interrupt = true;
	image_index = 0;
	sprite_index = player_attack1_spr;
}
else if (keyboard_check_pressed(ord("A")) && animation_interrupt && in_air && (sprite_index == player_jump_spr || sprite_index == player_fall_spr)) {
	animation_interrupt = true;
	image_index = 0;
	sprite_index = player_air_attack1_spr;
}



if (keyboard_check_pressed(ord("S")) && !animation_interrupt) {
	animation_interrupt = true;
	image_index = 0;
	sprite_index = player_attack2_spr;
}
else if (keyboard_check_pressed(ord("S")) && animation_interrupt && in_air && (sprite_index == player_jump_spr || sprite_index == player_fall_spr)) {
	animation_interrupt = true;
	image_index = 0;
	sprite_index = player_air_attack2_spr;
}



if (keyboard_check_pressed(ord("D")) && !animation_interrupt) {
	animation_interrupt = true;
	image_index = 0;
	sprite_index = player_attack3_spr;
}
else if (keyboard_check_pressed(ord("D")) && animation_interrupt && in_air && sprite_index == player_fall_spr) {
	animation_interrupt = true;
	image_index = 0;
	sprite_index = player_air_attack3_loop_spr;
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
	else {
        sprite_index = player_run_spr;
	}
}

if (h_dir != 0) {
	image_xscale = scale * h_dir;
}
