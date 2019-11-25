/// @description Creates a slider object with a width and length for storing menu object
range = [25,100];
scale = 1;
size_scale = 1;
height = 10;
currentVal = 0;
stepVal = 0;
continuous = false;
steps = 3;

xMin = x;
xMax = sprite_get_width(spr_sliderbar)*size_scale;
yMin = y;
yMax = sprite_get_height(spr_sliderbar)*size_scale;