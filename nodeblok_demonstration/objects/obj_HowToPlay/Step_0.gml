// Oscillate the cursor using sin function
cursorLevitate = 8*dsin(cursorTime);

// Use this as an "angle" to use in the sin function
// to oscillate cursor
cursorTime += leviRate;


// Vertical input is determined by the press of up
// and down buttons
var vert =  (keyboard_check_pressed(downButt)) -  (keyboard_check_pressed(upButt));

// Move cursor up or down depending on inputs
selected += vert;
selectLerp = lerp(selectLerp, selected, lerpAmt); // Smooth cursor movement

// Don't let cursor move past where it should be
selected = clamp(selected, 0, array_length_1d(global.howtoplay) - 1);

// Whenever you press the confirm button, do whatever
// it should do depending on what menu element is selected
if(keyboard_check_pressed(confirmButt))
{
	if(selected == 0) // Toggling Music on or off
	{
		obj_Transition.target = menu_room;
		SlideTransition(TRANS_MODE.GOTO);
	}
	
}

// Mouse Override 

var mouse_y_gui = mouse_y;
var mouse_x_gui = mouse_x;
	if (mouse_y_gui <= menu_bottom) && (mouse_y_gui >= menu_top) && (mouse_x_gui >= room_height/5 && mouse_x_gui <= room_height/15)
	{
		//selected = floor((mouse_y_gui - menu_top) / (menu_bottom - menu_top));
		if(mouse_y_gui >= menu_top && mouse_y_gui < menu_top + spacing) {
			selected = 0;
		} 
		
		selectLerp = lerp(selectLerp, selected, lerpAmt); // Smooth cursor movement
		
		
		if (mouse_check_button_pressed(mb_left))
		{
			if(selected == 0) // Exiting to Menu
			{
				obj_Transition.target = menu_room;
				SlideTransition(TRANS_MODE.GOTO);
			}
		}
	
	}
		