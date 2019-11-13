//Deals with generation of the blocks/spawn cooldown
//Win conditions of each room
switch(room) {
	case tutorial_room:
		oGuide.text = "Click the node in the center\nto change direction!";
		if(score >= 50) {
			obj_Transition.target = tutorial_room2; SlideTransition(TRANS_MODE.GOTO); 
			score = 0;
			start = 0;
		}
		if(oGuide.clicked && start > 90) {
			if(cooldown < 0) { 
				instance_create_depth(obj_square_spawner.x, obj_square_spawner.y, 3, obj_square);
				cooldown = 60 + irandom_range(0, 30);
			}
			cooldown--;
		}
		else if(oGuide.clicked && start <= 90) {
			start++;
		}
		break;
	case tutorial_room2:
		oGuide.text = "There can be more than one\nshape that spawns!";
		if(score >= 150) {
			obj_Transition.target = tutorial_room3; SlideTransition(TRANS_MODE.GOTO); 
			score = 0;
			start = 0;
		}
		if(oGuide.clicked && start > 90) {
			spawn = irandom_range(1, 2);
			if(cooldown < 0) { 
				if(spawn == 1)
					instance_create_depth(obj_square_spawner.x, obj_square_spawner.y, 3, obj_square);
				else if(spawn == 2)
					instance_create_depth(obj_circle_spawner.x, obj_circle_spawner.y, 3, obj_circle);
				cooldown = 25 + irandom_range(0, 30);
			}
			cooldown--;
		}
		else if(oGuide.clicked && start <= 90) {
			start++;
		}
		break;
	case tutorial_room3:
		oGuide.text = "There can also be more than\none node to move shapes!";
		if(score >= 300) {
			obj_Transition.target = main_room; SlideTransition(TRANS_MODE.GOTO); 
			score = 0;
			start = 0;
		}
		if(oGuide.clicked && start > 90) {
			spawn = irandom_range(1, 4);
			if(cooldown < 0) { 
				if(spawn == 1)
					instance_create_depth(obj_square_spawner.x, obj_square_spawner.y, 3, obj_square);
				else if(spawn == 2) {
					instance_create_depth(obj_circle_spawner.x, obj_circle_spawner.y, 3, obj_circle);
				}
				else if(spawn == 3) {
					obj_triangle_spawner.target = [obj_triangle_spawner.inst1.x, obj_triangle_spawner.inst1.y];
					instance_create_depth(obj_triangle_spawner.x, obj_triangle_spawner.y, 3, obj_triangle);
				}
				else if(spawn == 4) {
					obj_triangle_spawner.target = [obj_triangle_spawner.inst2.x, obj_triangle_spawner.inst2.y];
					instance_create_depth(obj_triangle_spawner.x, obj_triangle_spawner.y, 3, obj_triangle);
				}
				cooldown = 25 + irandom_range(0, 20);
			}
			cooldown--;
		}
		else if(oGuide.clicked && start <= 90) {
			start++;
		}
		break;
}