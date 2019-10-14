/// @description Insert description here
// You can write your code in this editor
if collision_point(mouse_x, mouse_y, obj_node, true, false) {
	if state == 1 {
		state = 0;
	} else if state == 0 {
		state = 1;
	}
	
	//Based on state, switch the image angle to point towards the
	//respective station (square or circle)
	switch(state) {
		case 0: image_angle = 30; break;
		case 1: image_angle = -30; break;
	}
}
