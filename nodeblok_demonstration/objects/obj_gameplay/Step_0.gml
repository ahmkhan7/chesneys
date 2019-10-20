//Deals with generation of the blocks/spawn cooldown
//Win conditions of each room
switch(room) {
	case tutorial_room:
		if(score == 50) {
			obj_Transition.target = tutorial_room2; SlideTransition(TRANS_MODE.GOTO); 
			score = 0;
		}
		if(cooldown < 0) { 
			instance_create_depth(obj_square_spawner.x, obj_square_spawner.y, 3, obj_square);
			cooldown = 60 + irandom_range(0, 30);
		}
		cooldown--;
		break;
	case tutorial_room2:
		if(score == 150) {
			obj_Transition.target = tutorial_room3; SlideTransition(TRANS_MODE.GOTO); 
			score = 0;
		}
		spawn = irandom_range(1, 2);
		if(cooldown < 0) { 
			if(spawn == 1)
				instance_create_depth(obj_square_spawner.x, obj_square_spawner.y, 3, obj_square);
			else if(spawn == 2)
				instance_create_depth(obj_circle_spawner.x, obj_circle_spawner.y, 3, obj_circle);
			cooldown = 25 + irandom_range(0, 30);
		}
		cooldown--;
		break;
	case tutorial_room3:
		if(score == 300) {
			obj_Transition.target = menu_room; SlideTransition(TRANS_MODE.GOTO); 
			score = 0;
		}
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
		
		/*
		spawn_left = irandom_range(1, 2);
		spawn_right = irandom_range(1, 2);
		
		if (cooldown_left < 0) {
			if(spawn_left == 1)
				instance_create_depth(obj_square_spawner.x, obj_square_spawner.y, 3, obj_square);
			else if(spawn_left == 2) {
				obj_triangle_spawner.target = [obj_triangle_spawner.inst1.x, obj_triangle_spawner.inst1.y];
				instance_create_depth(obj_triangle_spawner.x, obj_triangle_spawner.y, 3, obj_triangle);
			}
			cooldown_left = 65 + irandom_range(0, 30);
		}
		if(cooldown_right < 0) {
			if(spawn_right == 1) {
				obj_triangle_spawner.target = [obj_triangle_spawner.inst2.x, obj_triangle_spawner.inst2.y];
				instance_create_depth(obj_triangle_spawner.x, obj_triangle_spawner.y, 3, obj_triangle);
			}
			else if(spawn_right == 2) {
				instance_create_depth(obj_circle_spawner.x, obj_circle_spawner.y, 3, obj_circle);
			}
			cooldown_right = 65 + irandom_range(0, 30);
		}
		cooldown_left--;
		cooldown_right--;*/
		/*
		if(instance_number(obj_node) == 2) {
		if(irandom_range(1, 2) == 1)
			target = [inst1.x, inst1.y];
		else
			target = [inst2.x, inst2.y];
	}
	
	instance_create_depth(x, y, 3, obj_triangle);
	lastSpawn = 0;
	*/
		break;
}