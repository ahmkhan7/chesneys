if (point_in_circle(mouse_x,mouse_y,x,y,256) || display) && !instance_exists(oText)
{
	nearby = true;
	if keyboard_check_pressed(vk_space) or mouse_check_button_pressed(mb_left)
	{
		with (instance_create_layer(x,y-64,layer-1,oText))
		{ 
			text = other.text;
			length = string_length(text);
		}
	}
	if display {
		cont = false;
		with (instance_create_layer(x,y-64,layer-1,oText)) { 
			text = other.text;
			length = string_length(text);
		}
	}
}
else 
	nearby = false;