switch(room) { //executes appropriate gameplay code depending on current room.
	case tutorial_room:
		if(!stop_guide && mouse_check_button_released(mb_left) //plays next tutorial text if more is available
		&& mouse_x >=721 && mouse_x <= 1214 && mouse_y >= 402 && mouse_y <= 644) {
			guideCounter++;
		}
		else if(guideCounter == 6) {
			stop_guide = true;
			guideCounter++;
		}
		else if(guideCounter == 7) { //begins tutorial after all text has been scrolled through
			if(cooldown < 0) {
				//Pick one of the spawners to spawn at
				rand_spawner_num = irandom_range(0, 2);
				rand_spawner = ingredient_spawners[rand_spawner_num];
				//Spawn a random ingredient between the first and second recipe
				size_map = ds_map_size(obj_cooking_pot.recipe_ds);
				if size_map == 1 || size_map == 2
					rand_recipe_ingred = recipe_ingred_list[0, irandom_range(0, 4)];
				else
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
			size_map = ds_map_size(obj_cooking_pot.recipe_ds);
			if size_map == 1 || size_map == 2
				rand_recipe = current_recipe;
			else if current_recipe >= 0 && current_recipe < 6
				rand_recipe = irandom_range(current_recipe, current_recipe + 1);
			else
				rand_recipe = irandom_range(current_recipe - 1, current_recipe);
			
			//Pick a random ingredient from that recipe and spawn it and add a cooldown
            rand_recipe_ingred_num = irandom_range(0, 4);
            rand_recipe_ingred = recipe_ingred_list[rand_recipe, rand_recipe_ingred_num];
            instance_create_depth(rand_spawner.x, rand_spawner.y - 15, 1, rand_recipe_ingred[0]);
            cooldown = 60 + irandom_range(speed_bounds[0], speed_bounds[1]);
        }
        cooldown--;

		//Once a player finishes an order, award their coins and generate a new recipe
		if (obj_menu_order.completed_recipe)
		{
			coins += award_coins(obj_cooking_pot.num_attempts, recipe[1]);
			//Algorithm for giving the most recent recipe more probability of spawning
			//Determine nth triangular number for random recipe generation
			nth_tri_num = (unlocked_recipes + 1)*(unlocked_recipes + 2)/2
			rand_rec = irandom_range(1, nth_tri_num);
			for(c = 1; c <= nth_tri_num; ++c) {
				if(c == 1) current_recipe = 0;
				else if (c >= 2 && c < 4) current_recipe = 1;
				else if (c >= 4 && c < 7) current_recipe = 2;
				else if (c >= 7 && c < 11) current_recipe = 3;
				else if (c >= 11 && c < 16) current_recipe = 4;
				else if (c >= 16 && c < 22) current_recipe = 5;
				else if (c >= 22) current_recipe = 6;
				if(rand_rec == c) break;
			}
			recipe = recipe_list[current_recipe];
		}
}

//Play sound on mouse click
if (mouse_check_button_pressed(mb_left))
	audio_play_sound(Mouse_Click, 1, false);