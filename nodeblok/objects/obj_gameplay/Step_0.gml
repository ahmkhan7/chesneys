switch(room) {
	case main_room:
		if(cooldown < 0) {
			rand_spawner_num = irandom_range(0, 2);
			rand_spawner = ingredient_spawners[rand_spawner_num];
			
			if(rand_spawner_num == 1) {
				rand_spawner_num = irandom_range(0, 1);
				if(rand_spawner_num == 1) {
					rand_spawner.target[0] = instance_nearest(0, 0, obj_node).x;
					rand_spawner.target[1] = instance_nearest(0, 0, obj_node).y;
				}
			}
			
			rand_recipe = irandom_range(0, unlocked_recipes - 1);
			rand_recipe_ingred_num = irandom_range(0, 4);
			rand_recipe_ingred = recipe_ingred_list[rand_recipe, rand_recipe_ingred_num];
			instance_create_depth(rand_spawner.x, rand_spawner.y, 3, rand_recipe_ingred);
			cooldown = 60 + irandom_range(0, 30);
		}
		cooldown--;
}
	/*
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
	*/