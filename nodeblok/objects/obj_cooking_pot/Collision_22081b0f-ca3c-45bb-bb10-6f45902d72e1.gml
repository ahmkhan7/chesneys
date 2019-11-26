//Upon collision, check if other colliding object is in
//the hashmap and remove it if it exists. Increment
//the number of attempts and destroy the other ingredient.
var key = object_get_name(other.object_index);
if ds_map_exists(recipe_ds, key) {
	audio_play_sound(Correct_Ingredient, 1, false);
	ds_map_delete(recipe_ds, key);
	if(ds_map_empty(recipe_ds))
		obj_menu_order.completed_recipe = true;
}
else {
	audio_play_sound(Incorrect_Ingredient, 1, false);	
}
++num_attempts;
instance_destroy(other);