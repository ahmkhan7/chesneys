//Code to display the ingredients of the order
draw_self();
draw_set_font(fnt_ingredient_list);
var spacing = 55;
var indent = 50;
var attempts = obj_cooking_pot.num_attempts;
var earned_coins = 0;
draw_set_halign(fa_left);

//animate sprites that are animated
image_speed = 5;


//draws title
draw_set_halign(fa_center);
recipe = recipe_list[current_recipe];
recipe_name = recipe[1];
draw_text_color(x+sprite_width/2, y + 175, recipe_name, 0, 0, 0, 0, 100);
draw_set_halign(fa_left);

//Retrieves the ingredients from the ds and displays them
var size = ds_map_size(recipe_ds);
var key = ds_map_find_first(recipe_ds);
for(i = 0; i < size; ++i) {
	ingredient = key;
	draw_text_color(x + indent*2, y + 275 + spacing*i, string(ds_map_find_value(recipe_ds, key)), 0, 0, 0, 0, 100);
	currSprite = object_get_sprite(asset_get_index(ingredient));
	draw_sprite(currSprite, -1,  x + indent , y + 250 + spacing*i);
	key = ds_map_find_next(recipe_ds, key);
}


//Displays how many coins player will recieve for completing recipe

switch(recipe_name) {
	case "Salad":
		earned_coins += 10; break;
	case "Sandwich":
		earned_coins += 25; break;
	case "Omelette":
		earned_coins += 65; break;
	case "Taco":
		earned_coins += 105; break;
	case "Smoothie":
		earned_coins += 150; break;
	case "Spaghetti":
		earned_coins += 225; break;
	case "Steak":
		earned_coins += 450; break;
	default:
		earned_coins = 0; break;
}

if(attempts - 5 > 0 && attempts - 5 <= 5)
	earned_coins -= earned_coins * 0.20;
else if(attempts - 5 > 6 && attempts - 5 <= 10)
	earned_coins -= earned_coins * 0.40;
else if(attempts > 11)
	earned_coins -= earned_coins * 0.70; 

draw_sprite_ext(spr_coin, image_index,  x + indent , y + 245 + spacing*size, .4, .4, 0, c_white, 1);
draw_text_color(x + indent*2, y + 275 + spacing*size, "Reward: " +  string(earned_coins), c_blue, c_red, c_blue, c_red, 1);