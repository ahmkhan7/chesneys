//Grab the recipe from the recipe list based 
//on the next unlocked ingredient
if unlocked_items < 6
	next_unlock = recipe_list[unlocked_items + 1];
else
	next_unlock = "Chesney's\nJetpack";
	
//REPLACE CODE WITH SPRITE TO USE BUILT-IN FUNCTIONS
if (keyboard_check_pressed(ord("B")) || mouse_check_button_pressed(mb_left)) && unlocked_items < 7 {
	if((mouse_x >= 1550 && mouse_x <= 1830 && mouse_y >= 630 && mouse_y <= 740) || keyboard_check_pressed(ord("B"))) {
		coins_after_purchase = buy_next_item(obj_gameplay.coins, unlocked_items);
		if coins_after_purchase != -1 {
			obj_gameplay.coins = coins_after_purchase;
			++obj_gameplay.unlocked_recipes;
			++unlocked_items;
		}
	}
}
//Display an ending (all items were unlocked!)
else if unlocked_items == 7 {
	//Destroy the coin object
	if(instance_exists(obj_coin))
		instance_destroy(obj_coin);
	//Stop the ingredients from spawning
	if(instance_exists(obj_gameplay))
		obj_gameplay.stop = true;
	//Spawn in the jet pack and watch it fly away!
	if(spawn_jetpack) { //(entity not destroyed--yet)
		jetpack = instance_create_depth(1690, 475, 1, obj_jetpack);
		jetpack.vspeed = -4;
	}
	spawn_jetpack = false;
}