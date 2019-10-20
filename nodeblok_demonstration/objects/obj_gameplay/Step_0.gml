//Deals with generation of the blocks/spawn cooldown
//Win conditions of each room
switch(room) {
	case tutorial_room:
		if(score == 50) {
			obj_Transition.target = tutorial_room2; SlideTransition(TRANS_MODE.GOTO); 
			score = 0;
		}
		break;
	case tutorial_room2:
		if(score == 100) {
			obj_Transition.target = tutorial_room3; SlideTransition(TRANS_MODE.GOTO); 
			score = 0;
		}
		break;
	case tutorial_room3:
		if(score == 150) {
			obj_Transition.target = menu_room; SlideTransition(TRANS_MODE.GOTO); 
			score = 0;
		}
		break;
}