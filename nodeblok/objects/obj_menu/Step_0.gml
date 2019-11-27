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
if(keyboard_check_pressed(confirmButt)) {
	draw = false; //The selection has been made--stop drawing menu items
	if(selected == 0) // Main room
		obj_Transition.target = main_room; SlideTransition(TRANS_MODE.GOTO); 
	if(selected == 1) // Tutorial Room
		obj_Transition.target = tutorial_room; SlideTransition(TRANS_MODE.GOTO);
	if(selected == 2) // Options Room
		obj_Transition.target = options_room; SlideTransition(TRANS_MODE.GOTO);
	if(selected == 3) // Exit by default
		game_end();
}


//Mouse Over Menu Overide
var mouse_y_gui = mouse_y;
var mouse_x_gui = mouse_x;

if (mouse_y_gui <= menu_bottom) && (mouse_y_gui >= menu_top) && (mouse_x_gui >= 700 && mouse_x_gui <= 1100) {
	if(mouse_y_gui >= menu_top && mouse_y_gui < menu_top + spacing)
		selected = 0;
	else if (mouse_y_gui >= menu_top + spacing && mouse_y_gui < menu_top + spacing * 2)
		selected = 1;
	else if (mouse_y_gui >= menu_top + spacing * 2 && mouse_y_gui < menu_top + spacing * 3)
		selected = 2;
	else if (mouse_y_gui >= menu_top + spacing * 3 && mouse_y_gui < menu_bottom)
		selected = 3;
		
	selectLerp = lerp(selectLerp, selected, lerpAmt); // Smooth cursor movement
		
	if (mouse_check_button_pressed(mb_left)) {
		draw = false; //The selection has been made--stop drawing menu items
		if(selected == 0) // Learning Levels Room
			obj_Transition.target = main_room; SlideTransition(TRANS_MODE.GOTO); 
		if(selected == 1) // How to Play Room
			obj_Transition.target = tutorial_room; SlideTransition(TRANS_MODE.GOTO);
		if(selected == 2) // Options Room
			obj_Transition.target = options_room; SlideTransition(TRANS_MODE.GOTO);
		if(selected == 3) // Exit by default
			game_end();
	}
}
	
//Code that displays ingredients on the conveyer belt
//Loops through all recipes, displaying their ingredients
if (cooldown < 0) {
	if(r == 5) { k++; r = 0; }
	if(k == 6) { k = 0; r = 0; }
	recipe = obj_gameplay.recipe_ingred_list[k, r];
	instance_create_depth(ingredient_spawner.x, ingredient_spawner.y, 1,
								  recipe[0]);
	cooldown = 80;
	r++;
}
cooldown--;