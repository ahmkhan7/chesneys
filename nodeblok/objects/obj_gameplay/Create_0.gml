//Randomize the seed
random_set_seed(date_current_datetime());
randomize();

//Variables for spawn cooldown, ingredient generation, and player coins
stop = false;
cooldown = 30;
unlocked_recipes = 0;
current_recipe = 0;
coins = 0;
recipe = ["", ""];

//Variable for speed--determined by global.speed set in options
speed_bounds = [20, 110];
switch(global.speed) {
	case 0: speed_bounds = [70, 120]; break;
	case 0.25: speed_bounds = [50, 100]; break;
	case 0.5: speed_bounds = [20, 90]; break;
	case 0.75: speed_bounds = [10, 70]; break;
	case 1: speed_bounds = [0, 50]; break;
	default: speed_bounds = [20, 110]; break;
}

//Variables for the tutorial room
stop_guide = false;
guideCounter = 0;
guideText = ["There are three nodes (blue arrows) \nthat you can click on and they can \nchange direction! \nClick to continue.",
			  "Ingredients will spawn and you have\nto try to make the recipe that's on\nthe menu order (to the left)! \nClick to continue.",
			  "You earn full coins for completing \nrecipes correctly, and reduced coins \nif you use wrong ingredients.\nClick to continue.",
			  "Your goal is to buy all the recipes\nusing the cookbook (to the right).\nThe cost goes up every recipe.\nClick to continue.",
			  "Once you buy all the recipes, you\nhave to earn enough money to buy \nthe final jetpack to win!\nClick to continue.",
			  "Once you click again, I will spawn the\ningredients, and you must buy a \nsandwich to complete the tutorial!\nClick to continue.", ""];

//Create an array for the three ingredient spawner instances along the top
ingredient_spawners = [instance_nearest(0, 0, obj_ingredient_spawner),
					  instance_nth_nearest(0, 0, obj_ingredient_spawner, 2),
					  instance_nth_nearest(0, 0, obj_ingredient_spawner, 3)];
					  
//Create an array for each recipe object
recipe_list = [[obj_rcp_salad, "Salad"], [obj_rcp_sandwich, "Sandwich"], [obj_rcp_omelette, "Omelette"], 
			   [obj_rcp_taco, "Taco"], [obj_rcp_smoothie, "Smoothie"], [obj_rcp_spaghetti, "Spaghetti"], [obj_rcp_steak, "Steak"]];

//Create a 2D parallel array that relates each recipe to its ingredient list
recipe_ingred_list[0, 0] = [obj_lettuce, "Lettuce"]; recipe_ingred_list[0, 1] = [obj_carrot, "Carrot"];
recipe_ingred_list[0, 2] = [obj_cucumber, "Cucumber"]; recipe_ingred_list[0, 3] = [obj_redpepper, "Red Pepper"];
recipe_ingred_list[0, 4] = [obj_chicken, "Chicken"];
recipe_ingred_list[1, 0] = [obj_bread, "Bread"]; recipe_ingred_list[1, 1] = [obj_salami, "Salami"];
recipe_ingred_list[1, 2] = [obj_cheese, "Cheese"] ; recipe_ingred_list[1, 3] = [obj_lettuce, "Lettuce"];
recipe_ingred_list[1, 4] = [obj_tomato, "Tomato"];
recipe_ingred_list[2, 0] = [obj_eggs, "Eggs"]; recipe_ingred_list[2, 1] = [obj_onion, "Onion"];
recipe_ingred_list[2, 2] = [obj_redpepper, "Red Pepper"]; recipe_ingred_list[2, 3] = [obj_potato, "Potato"];
recipe_ingred_list[2, 4] = [obj_mushroom, "Mushroom"];
recipe_ingred_list[3, 0] = [obj_tortilla, "Tortilla"]; recipe_ingred_list[3, 1] = [obj_beef, "Beef"];
recipe_ingred_list[3, 2] = [obj_avocado, "Avocado"]; recipe_ingred_list[3, 3] = [obj_cheese, "Cheese"];
recipe_ingred_list[3, 4] = [obj_chilipepper, "Chili Pepper"];
recipe_ingred_list[4, 0] = [obj_milk, "Milk"]; recipe_ingred_list[4, 1] = [obj_strawberries, "Strawberries"];
recipe_ingred_list[4, 2] = [obj_bananas, "Bananas"]; recipe_ingred_list[4, 3] = [obj_coconut, "Coconut"];
recipe_ingred_list[4, 4] = [obj_honey, "Honey"];
recipe_ingred_list[5, 0] = [obj_noodles, "Noodles"]; recipe_ingred_list[5, 1] = [obj_meatballs, "Meatballs"];
recipe_ingred_list[5, 2] = [obj_tomatosauce, "Tomato Sauce"]; recipe_ingred_list[5, 3] = [obj_garlic, "Garlic"];
recipe_ingred_list[5, 4] = [obj_cheese, "Cheese"];
recipe_ingred_list[6, 0] = [obj_potato, "Potato"]; recipe_ingred_list[6, 1] = [obj_beef, "Beef"];
recipe_ingred_list[6, 2] = [obj_broccoli, "Broccoli"]; recipe_ingred_list[6, 3] = [obj_butter, "Butter"];
recipe_ingred_list[6, 4] = [obj_sauce, "Sauce"];