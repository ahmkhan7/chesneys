//Variables for ds creation, variables from other objects,
//and number of times the player attempts to make the recipe.
create_ds = true;
current_recipe = obj_gameplay.current_recipe;
recipe_list = obj_gameplay.recipe_list;
recipe_ingred_list = obj_gameplay.recipe_ingred_list;
recipe_ds = ds_map_create();
num_attempts = 0;
wrong_ingredients = 0;