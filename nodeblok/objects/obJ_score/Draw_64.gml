/// @description Insert description here
// You can write your code in this editor



// Draw score
if(room == tutorial_room)
	goal = 50;
else if(room == tutorial_room2)
	goal = 150;
else if(room == tutorial_room3)
	goal = 300;

draw_set_halign(fa_center);
draw_set_font(fnt_arial_large);
draw_text_color(room_width/2, room_height * .11 + 50, "Score:  " + string(score), 0,0,0,0, 100);
draw_text_color(room_width/2, room_height * .11, "Reach " + string(goal) + " points to move on!", 0,0,0,0, 100);
