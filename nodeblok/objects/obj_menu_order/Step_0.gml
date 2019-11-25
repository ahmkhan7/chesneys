//When the player finishes a recipe, get the newly generated recipe
//and indicate to the cooking pot object to create a new ds based
//on the recipe. Afterwards, set completed_recipe to false.
if(completed_recipe) {
	current_recipe = obj_gameplay.current_recipe;
	obj_cooking_pot.create_ds = true;
	completed_recipe = false;
}