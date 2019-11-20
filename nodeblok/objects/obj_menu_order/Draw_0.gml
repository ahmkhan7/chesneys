/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(fnt_ingredient_list);
var spacing = 65;
var indent = 50;


draw_set_halign(fa_center);
recipe = recipe_list[current_recipe];
recipe_name = recipe[1];
draw_text_color(x+sprite_width/2, y + 175, "Order Up!   " + recipe_name, 0, 0, 0, 0, 100);

draw_set_halign(fa_left);

	for (var i = 0; i < 5; i++)
	{
		ingredient = recipe_ingred_list[current_recipe, i];
		show_debug_message(ingredient[1]);
		draw_text_color(x + indent*2, y + 275 + spacing*i, ingredient[1], 0, 0, 0, 0, 100);
		currSprite = object_get_sprite(ingredient[0]);
		draw_sprite(currSprite, -1,  x + indent , y + 250 + spacing*i);
}