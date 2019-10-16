// Oscillate the cursor using sin function
cursorLevitate = dsin(cursorTime);

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
	if(selected == 0) // Learning Levels Room
	{
		obj_Transition.target = tutorial_room; SlideTransition(TRANS_MODE.GOTO); 
	}
	
	if(selected == 1) // How to Play Room
	{
		obj_Transition.target = help_room; SlideTransition(TRANS_MODE.GOTO);
	}
	
	if(selected == 2) // Options Room
	{
		obj_Transition.target = options_room; SlideTransition(TRANS_MODE.GOTO);
	}
	
	if(selected == 3) // Exit by default
	{
		game_end();
	}
}