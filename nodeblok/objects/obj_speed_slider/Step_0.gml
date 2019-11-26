/// @description Insert description here
// You can write your code in this editor
if (mouse_check_button(mb_left))
{
	show_debug_message(mouse_x);
	if(mouse_x < xMax && mouse_x > xMin && mouse_y > yMin && mouse_y < yMax)
	{
		percent = ((mouse_x - xMin) / (xMax - xMin));
		currentVal = x + (xMax - xMin)*size_scale*round(percent*4)/4;
		global.speed = round(percent*4)/4;
	}
}
