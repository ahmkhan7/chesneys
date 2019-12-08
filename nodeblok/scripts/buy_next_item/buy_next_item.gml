/// buy_next_item(coins, unlocked_items)
//
//  Returns a reduced coin count if the player can buy the next item
//	equivalent to the cost of the next item. If they can't afford it,
//	the function returns -1.
//
//      coins			      number of coins the player has, real
//      unlocked_recipes      current number of unlocked items, real
//
{
    var coins, unlocked_items;
	coins = argument0;
	unlocked_items = argument1;
	coins_before_purchase = coins;

	//Subtract coins by the cost of the item if
	//the player can able to afford the item.
	switch(unlocked_items) {
		case 0:
			if(coins >= 10) {
				audio_play_sound(Purchase_recipe, 1, false);
				coins -= 10;
			} break;
		case 1:
			if(coins >= 25) {
				audio_play_sound(Purchase_recipe, 1, false);
				coins -= 25;
			} break;
		case 2:
			if(coins >= 75) {
				audio_play_sound(Purchase_recipe, 1, false);
				coins -= 75;
			} break;
		case 3:
			if(coins >= 250) {
				audio_play_sound(Purchase_recipe, 1, false);
				coins -= 250;
			} break;
		case 4:
			if(coins >= 450) {
				audio_play_sound(Purchase_recipe, 1, false);
				coins -= 450;
			} break;
		case 5:
			if(coins >= 800) {
				audio_play_sound(Purchase_recipe, 1, false);
				coins -= 800;
			} break;
		case 6:
			if(coins >= 1050) {
				audio_play_sound(Purchase_recipe, 1, false);
				coins -= 1050;
			} break;
	}
	
	//If they cannot afford it, no points are subtracted
	//Return -1 to indicate that
	if(coins_before_purchase == coins)
		return -1;
	
	return coins;
}