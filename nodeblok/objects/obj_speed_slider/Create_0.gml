draw = true;
size_scale = 1;
height = 10;
currentVal = x + sprite_get_width(spr_sliderbar)*global.speed;
if(global.speed == 0)
	global.options[3] = "Speed - Very Easy";
else if (global.speed == 0.25)
	global.options[3] = "Speed - Easy";
else if (global.speed == 0.5)
	global.options[3] = "Speed - Medium";
else if (global.speed == 0.75)
	global.options[3] = "Speed - Hard";
else if (global.speed == 1)
	global.options[3] = "Speed - Challenge";

xMin = x;
xMax = x + sprite_get_width(spr_sliderbar)*size_scale;
yMin = y;
yMax = y + sprite_get_height(spr_sliderbar)*size_scale;