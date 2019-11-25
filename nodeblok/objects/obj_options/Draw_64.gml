/// @description Drawing Menu Elements

// Set default font
draw_set_font(fnt_menu);
nextPos = [0,0]; //nextPos stores where a new object should go for complex menu objects

// Loop through the array containing each menu element
for(i = 0; i < array_length_1d(global.options); i++)
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
	draw_text_transformed((width/2)-220, (height/2) + (fa_center+i*spacing)-100, global.options[i], 4, 4, 0);
	if (i < array_length_1d(global.options))
	{
		nextPos = [(width/2)-220, (height/2) + (fa_center+i*spacing)-100];
	}
}

//Draw speed slider
instance_create_depth(nextPos[0], nextPos[1] - spacing*2 + 20, 0, obj_slider);


// Getting width of cursor to separate it a bit from the menu
var cursWidth = sprite_get_width(s_cursor);

// Draw cursor at where it should be, but half its width 
// to the left of the menu
draw_sprite(s_cursor, -1, ((width/2)-240) + cursorLevitate - cursWidth/2,(((height/2)-100) + selectLerp*spacing)-65);

