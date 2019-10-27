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
selected = clamp(selected, 0, array_length_1d(global.menu) - 1);

// Whenever you press the confirm button, do whatever
// it should do depending on what menu element is selected
if(keyboard_check_pressed(confirmButt))
{
	if(selected == 0) // Toggling Music on or off
	{
		if audio_is_playing(menu_music)
		{
		
			audio_stop_sound(menu_music);
			global.options[0] = "Music: Off"
		}
		else
		{
			
			audio_play_sound(menu_music, 1, true);
			global.options[0] = "Music: On";
		}
	}
	
	if(selected == 1) // Change Sound Effects Enabled Boolean
	{
		if (global.sound_on) 
		{
			
			global.sound_on = false;
			global.options[1] = "Sound Effects: Off";
		}
		else
		{
			
			global.sound_on = true;	
			global.options[1] = "Sound Effects: On";
		}
	}
	
	if(selected == 2) // Toggling Full Screen on/off
	{
		if window_get_fullscreen()
		{
		
			window_set_fullscreen(false);
			global.options[2] = "Fullscreen: Off";
		}
		else
		{
			
			window_set_fullscreen(true);
			global.options[2] = "Fullscreen: On";
		}
	}
	
	if(selected == 3) // Exit to menu
	{
		obj_Transition.target = menu_room;
		SlideTransition(TRANS_MODE.GOTO);
	}
}

// Mouse Override 

var mouse_y_gui = mouse_y;
var mouse_x_gui = mouse_x;
	if (mouse_y_gui <= menu_bottom) && (mouse_y_gui >= menu_top) && (mouse_x_gui >= 642 && mouse_x_gui <= 1305)
	{
		//selected = floor((mouse_y_gui - menu_top) / (menu_bottom - menu_top));
		if(mouse_y_gui >= menu_top && mouse_y_gui < menu_top + spacing) {
			selected = 0;
		} else if (mouse_y_gui >= menu_top + spacing && mouse_y_gui < menu_top + spacing * 2) {
			selected = 1;
		} else if (mouse_y_gui >= menu_top + spacing * 2 && mouse_y_gui < menu_top + spacing * 3) {
			selected = 2;
		} else if (mouse_y_gui >= menu_top + spacing * 3 && mouse_y_gui < menu_bottom) {
			selected = 3;
		}
		
		selectLerp = lerp(selectLerp, selected, lerpAmt); // Smooth cursor movement
		
		
		if (mouse_check_button_pressed(mb_left))
		{
			if(selected == 0) // Toggling Music on or off
			{
				if audio_is_playing(menu_music)
				{
					//audio_play_sound(Decline,2,false);
					audio_stop_sound(menu_music);
					global.options[0] = "Music: Off"
				}
				else
				{
					//audio_play_sound(Accept,2,false);
					audio_play_sound(menu_music, 1, true);
					global.options[0] = "Music: On";
				}
			}
	
			if(selected == 1) // Change Sound Effects Enabled Boolean
			{
				if (global.sound_on) 
				{
					//audio_play_sound(Decline,2,false);
					global.sound_on = false;
					global.options[1] = "Sound Effects: Off";
				}
			else
			{
				//audio_play_sound(Accept,2,false);
				global.sound_on = true;	
				global.options[1] = "Sound Effects: On";
			}
			}
	
			if(selected == 2) // Toggling Full Screen on/off
			{
				if window_get_fullscreen()
				{
					audio_play_sound(Decline,2,false);
					window_set_fullscreen(false);
					global.options[2] = "Fullscreen: Off";
				}
				else
				{
					//audio_play_sound(Accept,2,false);
					window_set_fullscreen(true);
					global.options[2] = "Fullscreen: On";
				}
			}
	
			if(selected == 3) // Exit to menu
			{
				obj_Transition.target = menu_room;
				SlideTransition(TRANS_MODE.GOTO);
			}

		}
		
	}