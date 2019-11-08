/// @description Gameplay
//Demonstration only, no cooldown for spawns
//Set number of squares spawn (one)
//Collision with stations do nothing (yet)

if (cooldown <= 0)
{
if collision_point(mouse_x, mouse_y, obj_node, true, false) {
	if state == 1 {
		state = 0;
	} else if state == 0 {
		state = 1;
	}
	
	//Based on state, switch the image angle to point towards the
	//respective station (square or circle)
	switch(state) {
		case 0: image_angle = image_angle - 90; break;
		case 1: image_angle = image_angle + 90; break;
	}
	cooldown = 15;
}
}