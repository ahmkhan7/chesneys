//Grab the recipe from the recipe list based 
//on the next unlocked ingredient
if unlocked_items < 6
	next_unlock = recipe_list[unlocked_items + 1];
else
	next_unlock = "Chesney's Jetpack";
	
//REPLACE CODE WITH SPRITE TO USE BUILT-IN FUNCTIONS
if mouse_check_button_pressed(mb_left) {
	if(mouse_x >= 1550 && mouse_x <= 1830 && mouse_y >= 630 && mouse_y <= 740) {
		coins_after_purchase = buy_next_item(obj_gameplay.coins, unlocked_items);
		if coins_after_purchase != -1 {
			obj_gameplay.coins = coins_after_purchase;
			++unlocked_items;
		}
	}
}