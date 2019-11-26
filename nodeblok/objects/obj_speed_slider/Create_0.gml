/// @description Creates a slider object with a width and length for storing menu object
range = [25,100];
scale = 1;
size_scale = 1;
height = 10;
currentVal = x;
continuous = false;
steps = 3;
global.speed = 0;

xMin = x;
xMax = x + sprite_get_width(spr_sliderbar)*size_scale;
yMin = y;
yMax = y + sprite_get_height(spr_sliderbar)*size_scale;