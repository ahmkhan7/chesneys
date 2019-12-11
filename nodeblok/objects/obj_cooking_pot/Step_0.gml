//Will execute once a recipe is finished. It will trigger based on the state
//create_ds, which is changed from obj_menu_order. It creates a hashmap of
//recipe objects and their names.
if(create_ds) {
	num_attempts = 0;
	ds_map_destroy(recipe_ds);
	recipe_ds = ds_map_create();
	current_recipe = obj_gameplay.current_recipe;
	for(i = 0; i < 5; ++i) {
		recipe_ingred = recipe_ingred_list[current_recipe, i];
		ds_map_add(recipe_ds, object_get_name(recipe_ingred[0]), recipe_ingred[1]);
	}
	num_attempts = 0;
	wrong_ingredients = 0;
	create_ds = false;
}