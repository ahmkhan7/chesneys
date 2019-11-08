/// @description Size Variables and mode Setup

w = room_width;
h = room_height;
h_half = h*.5

enum TRANS_MODE {
	OFF, 
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

mode = TRANS_MODE.INTRO;
percent = 1;
target = room;
