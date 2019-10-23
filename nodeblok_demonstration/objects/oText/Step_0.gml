/// @desc Progress Text
letters += spd;
text_current = string_copy(text,1,floor(letters));

draw_set_font(fnt_arial_large);
if (h == 0) h = string_height(text);
w = string_width(text_current);

//Destroy text when done
if (letters >= length) 
{
	oGuide.sprite_index = spr_conductor;
	if	((keyboard_check_pressed(vk_anykey)) or mouse_check_button_pressed(mb_left))
	{
		instance_destroy();
	}
}
 