/// @description  Progress of Transition

if (mode != TRANS_MODE.OFF)
{
	if (mode == TRANS_MODE.INTRO)
		percent = max(0, percent - max((percent / 10), 0.005));
	else
		percent = min(1, percent + max(((1-percent)/10), 0.005));
		
	if (percent == 1) or (percent == 0) {
		switch (mode) {
			case TRANS_MODE.INTRO: 
				mode = TRANS_MODE.OFF
				break;
			case TRANS_MODE.NEXT: 
				mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;
			case TRANS_MODE.GOTO:
				mode = TRANS_MODE.INTRO;
				room_goto(target);
				break;
		}
		if(instance_exists(obj_menu))
			obj_menu.draw = true;
		else if(instance_exists(obj_options))
			obj_options.draw = true;
		else if(instance_exists(obj_speed_slider))
			obj_options.draw = true;
	}
}