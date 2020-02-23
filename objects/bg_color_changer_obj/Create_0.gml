/// @description Init bg color
randomize();
r = 224;
g = 255;
b = 194;
layer_id = layer_get_id("Background_Color");
bg_id = layer_background_get_id(layer_id);
unit = 1;
bias = -unit;