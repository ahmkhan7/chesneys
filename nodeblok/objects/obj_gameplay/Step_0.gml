switch(room) {
	case tutorial_room:
		if(!stop_guide && mouse_check_button_released(mb_left) 
		&& mouse_x >=721 && mouse_x <= 1214 && mouse_y >= 402 && mouse_y <= 644) {
			guideCounter++;
		}
		else if(guideCounter == 4) {
			stop_guide = true;
			guideCounter++;
		}
		else if(guideCounter == 5) {
			if(cooldown < 0) {
				//Pick one of the spawners to spawn at
				rand_spawner_num = irandom_range(0, 2);
				rand_spawner = ingredient_spawners[rand_spawner_num];
				//Spawn a random ingredient between the first and second recipe
				rand_recipe_ingred = recipe_ingred_list[irandom_range(0, 1), irandom_range(0, 4)];
				instance_create_depth(rand_spawner.x, rand_spawner.y - 15, 1, rand_recipe_ingred[0]);
				cooldown = 60 + irandom_range(20, 110);
			}
			cooldown--;
			
			//Once a player finishes an order, award their coins
			if (obj_menu_order.completed_recipe) {
				audio_play_sound(Complete_Recipe, 1, false);
				if(obj_cooking_pot.num_attempts == 5) coins += 10;
				else coins += 8;
			}
			//Go back to the menu once they've bought a sandwich
			if(unlocked_recipes == 1) {
				obj_Transition.target = menu_room; 
				SlideTransition(TRANS_MODE.GOTO);
			}
		}
		break;
    case main_room:
		//Spawn a random ingredient every random interval
        if(cooldown < 0 && !stop) {
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
			//cooldown = 60 + irandom_range(20, 110);
            cooldown = 60 + irandom_range(speed_bounds[0], speed_bounds[1]);
			show_debug_message(string(speed_bounds[0]) + " " + string(speed_bounds[1]));
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