if mouse_check_button(mb_left)
{
	//show_debug_message(mouse_x);
	if(mouse_x < xMax && mouse_x > xMin && mouse_y > yMin && mouse_y < yMax)
	{
		percent = ((mouse_x - xMin) / (xMax - xMin));
		//currentVal = x + (xMax - xMin)*size_scale*global.speed;
		global.speed = round(percent*4)/4;
		//show_debug_message(global.speed);
	}
}
else if (obj_options.selected == 3)
{
	if (keyboard_check_pressed(vk_left) && global.speed >= .25)
	{
		global.speed -= .25;
	}
	if (keyboard_check_pressed(vk_right) && global.speed <= .75)
	{
		global.speed += .25;
	}
	//currentVal = x + (xMax - xMin)*size_scale*global.speed;
		
}

currentVal = x + (xMax - xMin)*size_scale*global.speed;


