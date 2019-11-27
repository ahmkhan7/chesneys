/// @description Go to menu
//Stop drawing events in these objects before
//proceeding with the transition
if(instance_exists(obj_menu))
	obj_menu.draw = false;
if(instance_exists(obj_options))
	obj_options.draw = false;
if(instance_exists(obj_gameplay))
	obj_gameplay.stop_guide = true;
if(instance_exists(obj_speed_slider))
	obj_speed_slider.draw = false;

obj_Transition.target = menu_room;
SlideTransition(TRANS_MODE.GOTO);