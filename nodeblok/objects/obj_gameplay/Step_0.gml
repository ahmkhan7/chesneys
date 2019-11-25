switch(room) {
    case main_room:
		//Spawn a random ingredient every random interval
        if(cooldown < 0) {
			//Pick one of the spawners to spawn at
            rand_spawner_num = irandom_range(0, 2);
            rand_spawner = ingredient_spawners[rand_spawner_num];
            
			//Pick a random recipe's ingredients
			if current_recipe >= 0 && current_recipe < 6
				rand_recipe = irandom_range(current_recipe, current_recipe + 1);
			else
				rand_recipe = irandom_range(current_recipe - 1, current_recipe);
			
			//Pick a random ingredient from that recipe and spawn it and add a cooldown
            rand_recipe_ingred_num = irandom_range(0, 4);
            rand_recipe_ingred = recipe_ingred_list[rand_recipe, rand_recipe_ingred_num];
            instance_create_depth(rand_spawner.x, rand_spawner.y - 15, 1, rand_recipe_ingred[0]);
            cooldown = 60 + irandom_range(20, 110);
        }
        cooldown--;

		//Once a player finishes an order, award their coins and generate a new recipe
		if (obj_menu_order.completed_recipe)
		{
			coins += award_coins(obj_cooking_pot.num_attempts, recipe[1]);
			current_recipe = irandom_range(0, unlocked_recipes);
			recipe = recipe_list[current_recipe];
		}
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