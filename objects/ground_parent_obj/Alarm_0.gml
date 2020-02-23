/// @description Decorates object with tiles

// Currently just for square tiles. Can modify to include x and y components
var tile_size = 32;
// Get x and y by tile position, not pixel
x_t = x/tile_size;
y_t = y/tile_size;

// Get layer ID and map ID
var layer_id = layer_get_id("Tiles");
var map_id = layer_tilemap_get_id(layer_id);

// Manually set each tile
var final_col = (image_xscale*2)-1;
var final_row = (image_yscale*2)-1;
for (var col = 0; col < (image_xscale*2); col ++) {
	for (var row = 0; row < (image_yscale*2); row ++) {
		// Choose correct tile from the tilemap based on position
		// Corners
		if(row == 0 && col == 0) {
			tilemap_set(map_id, tile_TL, x_t+col, y_t+row);
			var tile_above = position_meeting((x_t+col)*tile_size, (y_t+row)*tile_size-tile_size, ground_parent_obj)
			var tile_left = position_meeting((x_t+col)*tile_size-tile_size, (y_t+row)*tile_size, ground_parent_obj)
			if(tile_above && tile_left)
				tilemap_set(map_id, tile_C, x_t+col, y_t+row);
			else if(tile_above)
				tilemap_set(map_id, tile_L, x_t+col, y_t+row);
			else if(tile_left)
				tilemap_set(map_id, tile_T, x_t+col, y_t+row);
		}
		else if(row == 0 && col == final_col) {
			tilemap_set(map_id, tile_TR, x_t+col, y_t+row);
			var tile_above = position_meeting((x_t+col)*tile_size, (y_t+row)*tile_size-tile_size, ground_parent_obj)
			var tile_right = position_meeting((x_t+col)*tile_size+tile_size, (y_t+row)*tile_size, ground_parent_obj)
			if(tile_above && tile_right)
				tilemap_set(map_id, tile_C, x_t+col, y_t+row);
			else if(tile_above)
				tilemap_set(map_id, tile_R, x_t+col, y_t+row);
			else if(tile_right)
				tilemap_set(map_id, tile_T, x_t+col, y_t+row);
		}
		else if(row == final_row && col == final_col) {
			tilemap_set(map_id, tile_BR, x_t+col, y_t+row);
			var tile_below = position_meeting((x_t+col)*tile_size, (y_t+row)*tile_size+tile_size, ground_parent_obj)
			var tile_right = position_meeting((x_t+col)*tile_size+tile_size, (y_t+row)*tile_size, ground_parent_obj)
			if(tile_below && tile_right)
				tilemap_set(map_id, tile_C, x_t+col, y_t+row);
			else if(tile_below)
				tilemap_set(map_id, tile_R, x_t+col, y_t+row);
			else if(tile_right)
				tilemap_set(map_id, tile_B, x_t+col, y_t+row);
		}
		else if(row == final_row && col == 0) {
			tilemap_set(map_id, tile_BL, x_t+col, y_t+row);
			var tile_below = position_meeting((x_t+col)*tile_size, (y_t+row)*tile_size+tile_size, ground_parent_obj)
			var tile_left = position_meeting((x_t+col)*tile_size-tile_size, (y_t+row)*tile_size, ground_parent_obj)
			if(tile_below && tile_left)
				tilemap_set(map_id, tile_C, x_t+col, y_t+row);
			else if(tile_below)
				tilemap_set(map_id, tile_L, x_t+col, y_t+row);
			else if(tile_left)
				tilemap_set(map_id, tile_B, x_t+col, y_t+row);
		}
		// Sides
		else if(row == 0) {
			tilemap_set(map_id, tile_T, x_t+col, y_t+row);
			if(position_meeting((x_t+col)*tile_size, (y_t+row)*tile_size-tile_size, ground_parent_obj)) {
				tilemap_set(map_id, tile_C, x_t+col, y_t+row);
			}
		}
		else if(col == 0) {
			tilemap_set(map_id, tile_L, x_t+col, y_t+row);
			if(position_meeting((x_t+col)*tile_size-tile_size, (y_t+row)*tile_size, ground_parent_obj)) {
				tilemap_set(map_id, tile_C, x_t+col, y_t+row);
			}
		}
		else if(col == final_col) {
			tilemap_set(map_id, tile_R, x_t+col, y_t+row);
			if(position_meeting((x_t+col)*tile_size+tile_size, (y_t+row)*tile_size, ground_parent_obj)) {
				tilemap_set(map_id, tile_C, x_t+col, y_t+row);
			}
		}
		else if(row == final_row) {
			tilemap_set(map_id, tile_B, x_t+col, y_t+row);
			if(position_meeting((x_t+col)*tile_size, (y_t+row)*tile_size+tile_size, ground_parent_obj)) {
				tilemap_set(map_id, tile_C, x_t+col, y_t+row);
			}
		}
		// Body
		else {
			tilemap_set(map_id, tile_C, x_t+col, y_t+row);
		}
	}
}

/*
mx = x_t+col;
my = y_t+row;
tilemap_set(map_id, 16, mx, my);
var data = tilemap_get(map_id, mx, my);
var flip = tile_get_flip(data);
data = tile_set_flip(data, !flip);
tilemap_set(map_id, data, mx, my
*/

//alarm[0] = 60;