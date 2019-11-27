/// @description Go to menu
if(instance_exists(obj_menu))
	obj_menu.draw = false;
if(instance_exists(obj_options))
	obj_options.draw = false;
obj_Transition.target = menu_room;
SlideTransition(TRANS_MODE.GOTO);