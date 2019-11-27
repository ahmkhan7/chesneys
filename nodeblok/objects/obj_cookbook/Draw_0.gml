//Code for display of the menu
draw_self();
draw_set_font(fnt_ingredient_list);
draw_set_halign(fa_center);

if(unlocked_items != 7) {
	//Displays the "Menu" title
	draw_text_color(x+sprite_width/2, y + 100, "Menu", 0, 0, 0, 0, 100);
	draw_set_halign(fa_left);
	
	//Displays the coin sprite and coin amount
	draw_text_color(x+sprite_width/2, y+220, + " " + string(obj_gameplay.coins), 0, 0, 0, 0, 100);

	//Displays a button for buying the next item
	draw_sprite(spr_rectangle, -1, 1565, 630);
	draw_set_font(fnt_ingredient_list_small);
	if unlocked_items < 6
		draw_text_color(x + sprite_width/5, y  + sprite_height/1.25, "Buy Next Recipe\n$" + 
						+ string(next_item_cost[unlocked_items]) + " " + string(next_unlock[1]), 0, 0, 0, 0, 100);
	else if unlocked_items < 7
		draw_text_color(x + sprite_width/5, y  + sprite_height/1.15, "Buy Final Item!\n$" 
						+ string(next_item_cost[unlocked_items]) + " " + string(next_unlock), 0, 0, 0, 0, 100);
}
//Display winning text
else {
	draw_text_color(x + sprite_width/2, y  + sprite_height/1.5, "You win!\nPress M to return\n to the menu.", 0, 0, 0, 0, 100);
}