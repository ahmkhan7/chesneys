//Code to display the ingredients of the order
draw_self();
draw_set_font(fnt_ingredient_list);
var spacing = 65;
var indent = 50;

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