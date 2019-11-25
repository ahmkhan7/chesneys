// Menu element names. This will be what is actually drawn
global.menu[0] = "Play";
global.menu[1] = "Tutorial";
global.menu[2] = "Options";
global.menu[3] = "Exit";

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

// Buttons for Mouse Override
menu_itemheight = font_get_size(fnt_menu);
menu_top = (height/2-150);
menu_bottom = menu_top + (spacing*array_length_1d(global.menu));

score = 0;