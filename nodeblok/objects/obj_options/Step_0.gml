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


//for speed settings, skips phantom option in order to allow room in the menu for the slider
if (selected == 4)
{
	selected += vert;
}

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
			global.options[1] = "Colorblind Filter: Deuteranopia";
			shader_set(global.shader);
		}
		else if (global.shader == xot_cbs_shDeuteranopia)
		{
			global.shader = xot_cbs_shProtanopia;	
			global.options[1] = "Colorblind Filter: Protanopia";
			shader_set(global.shader);
		}
		else if (global.shader == xot_cbs_shProtanopia)
		{
			global.shader = xot_cbs_shTritanopia;	
			global.options[1] = "Colorblind Filter: Tritanopia";
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
			global.options[3] = "Difficulty - Very Easy";
		else if (global.speed == 0.25)
			global.options[3] = "Difficulty - Easy";
		else if (global.speed == 0.5)
			global.options[3] = "Difficulty - Medium";
		else if (global.speed == 0.75)
			global.options[3] = "Difficulty - Hard";
		else if (global.speed == 1)
			global.options[3] = "Difficulty - Challenge";	
	}
	if(selected == 5) // Exit to menu
	{
		draw = false;
		if(instance_exists(obj_speed_slider))
			obj_speed_slider.draw = false;
		obj_Transition.target = menu_room;
		SlideTransition(TRANS_MODE.GOTO);
	}
}

//Arrow key capability for changing the color blind filter options
if(selected == 1 && keyboard_check_pressed(vk_right)) {
	if (global.shader == xot_cbs_shTritanopia) {
		global.shader = "none";
		global.options[1] = "Colorblind Filter: Off";
		shader_reset();
	}
	else if (global.shader == "none") {
		global.shader = xot_cbs_shDeuteranopia;	
		global.options[1] = "Colorblind Filter: Deuteranopia";
		shader_set(global.shader);
	}
	else if (global.shader == xot_cbs_shDeuteranopia) {
		global.shader = xot_cbs_shProtanopia;	
		global.options[1] = "Colorblind Filter: Protanopia";
		shader_set(global.shader);
	}
	else if (global.shader == xot_cbs_shProtanopia) {
		global.shader = xot_cbs_shTritanopia;	
		global.options[1] = "Colorblind Filter: Tritanopia";
		shader_set(global.shader);
	}
}
else if(selected == 1 && keyboard_check_pressed(vk_left)) {
	if (global.shader == xot_cbs_shTritanopia) {
		global.shader = xot_cbs_shProtanopia;
		global.options[1] = "Colorblind Filter: Protanopia";
		shader_set(global.shader);
	}
	else if (global.shader == "none") {
		global.shader = xot_cbs_shTritanopia;	
		global.options[1] = "Colorblind Filter: Tritanopia";
		shader_set(global.shader);
	}
	else if (global.shader == xot_cbs_shDeuteranopia) {
		global.shader = "none";	
		global.options[1] = "Colorblind Filter: Off";
		shader_reset();
	}
	else if (global.shader == xot_cbs_shProtanopia) {
		global.shader = xot_cbs_shDeuteranopia;	
		global.options[1] = "Colorblind Filter: Deuteranopia";
		shader_set(global.shader);
	}
}

//Get distance from prev mouse to real-time mouse
var moving = point_distance(mxprev, myprev, mouse_x, mouse_y);

//Update positions of prev mouse
mxprev = mouse_x;
myprev = mouse_y;

// Mouse Override 
var mouse_y_gui = mouse_y;
var mouse_x_gui = mouse_x;
if (mouse_y_gui <= menu_bottom) && (mouse_y_gui >= menu_top) && (mouse_x_gui >= 700 && mouse_x_gui <= 1300) && moving && !mouse_check_button_pressed(mb_left)
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
else if (mouse_y_gui <= menu_bottom) && (mouse_y_gui >= menu_top) && (mouse_x_gui >= 700 && mouse_x_gui <= 1300) && moving && mouse_check_button_pressed(mb_left) {
	if(selected == 0 && (mouse_y_gui >= menu_top && mouse_y_gui < menu_top + spacing)) // Toggling Music on or off
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
	
		if(selected == 1 && mouse_y_gui >= menu_top + spacing && mouse_y_gui < menu_top + spacing * 2) // Change Shader
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
				global.options[1] = "Colorblind Filter: Deuteranopia";
				shader_set(global.shader);
			}
			else if (global.shader == xot_cbs_shDeuteranopia)
			{
				global.shader = xot_cbs_shProtanopia;	
				global.options[1] = "Colorblind Filter: Protanopia";
				shader_set(global.shader);
			}
			else if (global.shader == xot_cbs_shProtanopia)
			{
				global.shader = xot_cbs_shTritanopia;	
				global.options[1] = "Colorblind Filter: Tritanopia";
				shader_set(global.shader);
			}
		}
	
		if(selected == 2 && mouse_y_gui >= menu_top + spacing * 2 && mouse_y_gui < menu_top + spacing * 3) // Toggling Full Screen on/off
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
		if(selected == 5 && mouse_y_gui >= menu_top + spacing * 5 && mouse_y_gui < menu_bottom) // Exit to menu
		{
			draw = false;
			if(instance_exists(obj_speed_slider))
				obj_speed_slider.draw = false;
			obj_Transition.target = menu_room;
			SlideTransition(TRANS_MODE.GOTO);
		}
}
else if (mouse_y_gui <= menu_bottom) && (mouse_y_gui >= menu_top) && (mouse_x_gui >= 700 && mouse_x_gui <= 1300) && !moving {
	if (mouse_check_button_pressed(mb_left)) {
		if(selected == 0 && (mouse_y_gui >= menu_top && mouse_y_gui < menu_top + spacing)) // Toggling Music on or off
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
	
		if(selected == 1 && mouse_y_gui >= menu_top + spacing && mouse_y_gui < menu_top + spacing * 2) // Change Shader
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
				global.options[1] = "Colorblind Filter: Deuteranopia";
				shader_set(global.shader);
			}
			else if (global.shader == xot_cbs_shDeuteranopia)
			{
				global.shader = xot_cbs_shProtanopia;	
				global.options[1] = "Colorblind Filter: Protanopia";
				shader_set(global.shader);
			}
			else if (global.shader == xot_cbs_shProtanopia)
			{
				global.shader = xot_cbs_shTritanopia;	
				global.options[1] = "Colorblind Filter: Tritanopia";
				shader_set(global.shader);
			}
		}
	
		if(selected == 2 && mouse_y_gui >= menu_top + spacing * 2 && mouse_y_gui < menu_top + spacing * 3) // Toggling Full Screen on/off
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
		if(selected == 5 && mouse_y_gui >= menu_top + spacing * 5 && mouse_y_gui < menu_bottom) // Exit to menu
		{
			draw = false;
			if(instance_exists(obj_speed_slider))
				obj_speed_slider.draw = false;
			obj_Transition.target = menu_room;
			SlideTransition(TRANS_MODE.GOTO);
		}
	}
}
		
selectLerp = lerp(selectLerp, selected, lerpAmt); // Smooth cursor movement
		

//Check this outside based on the value of global.speed
if(selected == 3) {
	if(global.speed == 0)
		global.options[3] = "Difficulty - Very Easy";
	else if (global.speed == 0.25)
		global.options[3] = "Difficulty - Easy";
	else if (global.speed == 0.5)
		global.options[3] = "Difficulty - Medium";
	else if (global.speed == 0.75)
		global.options[3] = "Difficulty - Hard";
	else if (global.speed == 1)
		global.options[3] = "Difficulty - Challenge";	
}

//play sound on mouse click
if (mouse_check_button_pressed(mb_left) && room == options_room)
	audio_play_sound(Mouse_Click, 1, false);