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
selected = clamp(selected, 0, array_length_1d(global.options) - 1);

// Whenever you press the confirm button, do whatever
// it should do depending on what menu element is selected
if(keyboard_check_pressed(confirmButt))
{
	if(selected == 0) // Toggling Music on or off
	{
		if audio_is_playing(Bustling_City)
		{
			audio_stop_sound(Bustling_City);
			global.options[0] = "Music: Off"
			
		}
		else
		{
			audio_play_sound(Bustling_City, 1, true);
			global.options[0] = "Music: On";
		}
	}
	
	if(selected == 1) // Change Shader
	{
		if (global.shader == xot_cbs_shTritanopia) 
		{
			global.shader = "none";
			global.options[1] = "Colorblind Filter: Off";
			shader_reset();
		}
		else if (global.shader == "none")
		{
			global.shader = xot_cbs_shDeuteranopia;	
			global.options[1] = "Colorblind Filter: Red/Green";
			shader_set(global.shader);
		}
		else if (global.shader == xot_cbs_shDeuteranopia)
		{
			global.shader = xot_cbs_shProtanopia;	
			global.options[1] = "Colorblind Filter: Green/Red";
			shader_set(global.shader);
		}
		else if (global.shader == xot_cbs_shProtanopia)
		{
			global.shader = xot_cbs_shTritanopia;	
			global.options[1] = "Colorblind Filter: Blue/Yellow";
			shader_set(global.shader);
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
	if(selected == 3)
	{
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
	}
	if(selected == 5) // Exit to menu
	{
		draw = false;
		obj_Transition.target = menu_room;
		SlideTransition(TRANS_MODE.GOTO);
	}
}

// Mouse Override 

var mouse_y_gui = mouse_y;
var mouse_x_gui = mouse_x;
if (mouse_y_gui <= menu_bottom) && (mouse_y_gui >= menu_top) && (mouse_x_gui >= 700 && mouse_x_gui <= 1300)
{
	if(mouse_y_gui >= menu_top && mouse_y_gui < menu_top + spacing) {
		selected = 0;
	} else if (mouse_y_gui >= menu_top + spacing && mouse_y_gui < menu_top + spacing * 2) {
		selected = 1;
	} else if (mouse_y_gui >= menu_top + spacing * 2 && mouse_y_gui < menu_top + spacing * 3) {
		selected = 2;
	} else if (mouse_y_gui >= menu_top + spacing * 3 && mouse_y_gui < menu_top + spacing * 4) {
		selected = 3;
	} else if (mouse_y_gui >= menu_top + spacing * 5 && mouse_y_gui < menu_bottom) {
		selected = 5;
	}
}
		
selectLerp = lerp(selectLerp, selected, lerpAmt); // Smooth cursor movement
		
		
if (mouse_check_button_pressed(mb_left))
{
	if(selected == 0) // Toggling Music on or off
	{
		if audio_is_playing(Bustling_City)
		{
			audio_stop_sound(Bustling_City);
			global.options[0] = "Music: Off"
		}
		else
		{
			audio_play_sound(Bustling_City, 1, true);
			global.options[0] = "Music: On";
		}
	}
	
	if(selected == 1) // Change Shader
	{
		if (global.shader == xot_cbs_shTritanopia) 
		{
			global.shader = "none";
			global.options[1] = "Colorblind Filter: Off";
			shader_reset();
		}
		else if (global.shader == "none")
		{
			global.shader = xot_cbs_shDeuteranopia;	
			global.options[1] = "Colorblind Filter: Red/Green";
			shader_set(global.shader);
		}
		else if (global.shader == xot_cbs_shDeuteranopia)
		{
			global.shader = xot_cbs_shProtanopia;	
			global.options[1] = "Colorblind Filter: Green/Red";
			shader_set(global.shader);
		}
		else if (global.shader == xot_cbs_shProtanopia)
		{
			global.shader = xot_cbs_shTritanopia;	
			global.options[1] = "Colorblind Filter: Blue/Yellow";
			shader_set(global.shader);
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
	if(selected == 5) // Exit to menu
	{
		draw = false;
		obj_Transition.target = menu_room;
		SlideTransition(TRANS_MODE.GOTO);
	}

}

//Check this outside based on the avlue of global.speed
if(selected == 3) {
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
}


		
	