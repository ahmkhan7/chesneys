/// @description Drawing Menu Elements

// Set default font
draw_set_font(fnt_monogram);


// Loop through the array containing each menu element
for(i = 0; i < array_length_1d(global.menu); i++)
{
	// If you're looking at the currently selected element, 
	// then draw it with a certain color, if not, then with
	// another color
	if(selected == i)
	{
		draw_set_color(selectedCol);
	}
	else
	{
		draw_set_color(notSelectedCol);
	}
	
	// Draw the text
	draw_text_transformed((width/2)-200, 50 + (height/2) + (fa_center+i*spacing), global.menu[i], 4, 4, 0);	
}
// Getting width of cursor to separate it a bit from the menu
var cursWidth = sprite_get_width(s_cursor);

// Draw cursor at where it should be, but half its width 
// to the left of the menu
draw_sprite(s_cursor, -1, ((width/2)-200) + cursorLevitate - cursWidth/2, 50+(((height/2)) + selectLerp*spacing)-55);

// Draw game title (at 10% of screen width and height, hence 0.1)
draw_set_color(titleCol);

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_transformed(display_get_gui_width()*0.5, display_get_gui_height()*0.4 , gameTitle, titleSize, titleSize,0);