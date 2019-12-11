/// award_coins(num_attempts, current_recipe)
//
//  Returns the number of coins a player earned on an order
//
//      num_attempts        number of tries to get recipe, real
//      current_recipe      name of the recipe, string
//
{
    var num_attempts, current_recipe, earned_coins;
	num_attempts = argument0;
	current_recipe = argument1;
	earned_coins = 0;

	//Based on the ingredient, award coins to the player and play a sound cue
	switch(current_recipe) {
		case "Salad":
			audio_play_sound(Complete_Recipe, 1, false);
			earned_coins += 10; break;
		case "Sandwich":
			audio_play_sound(Complete_Recipe, 1, false);
			earned_coins += 25; break;
		case "Omelette":
			audio_play_sound(Complete_Recipe, 1, false);
			earned_coins += 65; break;
		case "Taco":
			audio_play_sound(Complete_Recipe, 1, false);
			earned_coins += 105; break;
		case "Smoothie":
			audio_play_sound(Complete_Recipe, 1, false);
			earned_coins += 150; break;
		case "Spaghetti":
			audio_play_sound(Complete_Recipe, 1, false);
			earned_coins += 225; break;
		case "Steak":
			audio_play_sound(Complete_Recipe, 1, false);
			earned_coins += 450; break;
		default:
			earned_coins = 0; break;
	}
	
	//Take away coins based on the number of attempts the player took
	//to make the ingredient
	if(num_attempts - 5 > 0 && num_attempts - 5 <= 5)
		earned_coins -= earned_coins * 0.20;
	else if(num_attempts - 5 >= 6 && num_attempts - 5 <= 10)
		earned_coins -= earned_coins * 0.40;
	else if(num_attempts - 5 >= 11)
		earned_coins -= earned_coins * 0.70; 
	
	//Return earned_coins as a truncated double
    return floor(earned_coins);
}