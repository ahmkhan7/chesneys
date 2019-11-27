if(room == tutorial_room) {
	if(!stop_guide) {
		draw_sprite(spr_rectangle_large, -1, 1224, 402);
		draw_text_color(735, 600, guideText[guideCounter], 0, 0, 0, 0, 100);
	}
}