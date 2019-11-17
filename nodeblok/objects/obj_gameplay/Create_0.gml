randomize();
start = 0;
cooldown = 30;
unlocked_recipes = 1;

//Create an array for the three ingredient spawner instances along the top
ingredient_spawners = [instance_nearest(0, 0, obj_ingredient_spawner),
					  instance_nth_nearest(0, 0, obj_ingredient_spawner, 2),
					  instance_nth_nearest(0, 0, obj_ingredient_spawner, 3)];
					  
//Create an array for each recipe object
recipe_list = [obj_rcp_salad, obj_rcp_sandwich, obj_rcp_omelette, 
			   obj_rcp_taco, obj_rcp_smoothie, obj_rcp_spaghetti, obj_rcp_steak];
					  
//Create a 2D parallel array that relates each recipe to its ingredient list
recipe_ingred_list[0, 0] = obj_lettuce; recipe_ingred_list[0, 1] = obj_carrot;
recipe_ingred_list[0, 2] = obj_cucumber; recipe_ingred_list[0, 3] = obj_redpepper;
recipe_ingred_list[0, 4] = obj_chicken;
recipe_ingred_list[1, 0] = obj_bread recipe_ingred_list[1, 1] = obj_salami;
recipe_ingred_list[1, 2] = obj_cheese; recipe_ingred_list[1, 3] = obj_lettuce;
recipe_ingred_list[1, 4] = obj_tomato;
recipe_ingred_list[2, 0] = obj_eggs; recipe_ingred_list[2, 1] = obj_onion;
recipe_ingred_list[2, 2] = obj_orangepepper; recipe_ingred_list[2, 3] = obj_potato;
recipe_ingred_list[2, 4] = obj_mushroom;
recipe_ingred_list[3, 0] = obj_tortilla; recipe_ingred_list[3, 1] = obj_beef;
recipe_ingred_list[3, 2] = obj_avocado; recipe_ingred_list[3, 3] = obj_cheese;
recipe_ingred_list[3, 4] = obj_chilipepper;
recipe_ingred_list[4, 0] = obj_milk; recipe_ingred_list[4, 1] = obj_strawberries;
recipe_ingred_list[4, 2] = obj_bananas; recipe_ingred_list[4, 3] = obj_coconut;
recipe_ingred_list[4, 4] = obj_honey;
recipe_ingred_list[5, 0] = obj_noodles; recipe_ingred_list[5, 1] = obj_meatballs;
recipe_ingred_list[5, 2] = obj_tomatosauce; recipe_ingred_list[5, 3] = obj_garlic;
recipe_ingred_list[5, 4] = obj_cheese;
recipe_ingred_list[6, 0] = obj_potato; recipe_ingred_list[6, 1] = obj_beef;
recipe_ingred_list[6, 2] = obj_broccoli; recipe_ingred_list[6, 3] = obj_butter;
recipe_ingred_list[6, 4] = obj_sauce;