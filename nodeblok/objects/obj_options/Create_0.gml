// Menu element names. This will be what is actually drawn
//For each global option, determine its state before going
//into the options screen
if audio_is_playing(Bustling_City)
	global.options[0] = "Music: On";
else
	global.options[0] = "Music: Off";

if (global.shader == xot_cbs_shTritanopia) 
	global.options[1] = "Colorblind Filter: Off";
else if (global.shader == "none")
	global.options[1] = "Colorblind Filter: Deuteranopia";
else if (global.shader == xot_cbs_shDeuteranopia)
	global.options[1] = "Colorblind Filter: Protanopia";
else if (global.shader == xot_cbs_shProtanopia)
	global.options[1] = "Colorblind Filter: Tritanopia";

if window_get_fullscreen()
	global.options[2] = "Full Screen: On";
else
	global.options[2] = "Full Screen: Off";

global.options[3] = "Speed";
global.options[4] = "   ";
global.options[5] = "Exit to Menu";
	
//Variable dictating whether to draw the menu items
draw = true;

//Getting the width and height of the GUI
height = room_height;
width = room_width;

// cursorLevitate will be used to keep a variable that
// oscillates and moves the cursor back and forth
cursorLevitate = 0;

// cursorTime will be used as the "angle" of a sin function
// in conjunction with cursorlevitate to oscillate the cursor
cursorTime = 0;

// The rate at which the cursor oscillates. Higher value means faster
leviRate = 3;

// Holds what menu element is selected corresponding with the array index number. Ex: if selected = 1, 
// then the selected element is Options.
selected = 0;
selectLerp = 0; // Same as previous line but for lerp (smooth movement)
lerpAmt = 0.2; // Higher number -> faster cursor (between 0 and 1)

// Spacing between each menu element when drawn
spacing = 75;

// Color of the menu element when selected
selectedCol = c_white;

// Color of the menu element when not selected
notSelectedCol = c_black;

// Game title color
titleCol = c_black;

// Title of your game
gameTitle = "Nodeblok";

// Size of the title
titleSize = 8;

// Buttons to move up the menu
upButt = vk_up;
// Button to move down the menu
downButt = vk_down;

// Button to confirm menu choice
confirmButt = vk_enter;

menu_itemheight = font_get_size(fnt_menu);
menu_top = (height/2-150) - 100;
menu_bottom = menu_top + (spacing*array_length_1d(global.options));