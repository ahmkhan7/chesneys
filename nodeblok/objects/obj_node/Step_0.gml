with(first_node) {
	if(keyboard_check_pressed(ord("K"))) {
		if (currentTarget < array_length_1d(targetList) - 1)
			currentTarget++;
		else
			currentTarget = 0;
		
		target = targetList[currentTarget];
		image_angle = point_direction(x , y, target[0], target[1]);
		//audio_play_sound(Mouse_Click, 1, false);
	}
	
	/*//Determine which arrow the user pressed and change the target/sprite accordingly
	if(point_in_rectangle(mouse_x, mouse_y, 599, 507, 633, 540)) {
		target = targetList[0];
		sprite_index = spr_node_left1;
	}
	else if(point_in_rectangle(mouse_x, mouse_y, 564, 541, 596, 576)) {
		target = targetList[1];
		sprite_index = spr_node_left2;
	}*/
}

with(second_node) {
	//Determine which arrow the user pressed and change the target/sprite accordingly
	if(keyboard_check_pressed(ord("S"))) {
		target = targetList[0];
		sprite_index = spr_node_mid1;
		//audio_play_sound(Mouse_Click, 1, false);
	}
	else if(keyboard_check_pressed(ord("D"))) {
		target = targetList[1];
		sprite_index = spr_node_mid2;
		//audio_play_sound(Mouse_Click, 1, false);
	}
	else if(keyboard_check_pressed(ord("A"))) {
		target = targetList[2];
		sprite_index = spr_node_mid3;
		//audio_play_sound(Mouse_Click, 1, false);
	}
}

with(third_node) {
	if(keyboard_check_pressed(ord("L"))) {
		if (currentTarget < array_length_1d(targetList) - 1)
			currentTarget++;
		else
			currentTarget = 0;
		
		target = targetList[currentTarget];
		image_angle = point_direction(x , y, target[0], target[1]);
		//audio_play_sound(Mouse_Click, 1, false);
	}
	
	/*
	//Determine which arrow the user pressed and change the target/sprite accordingly
	if(point_in_rectangle(mouse_x, mouse_y, 1294, 507, 1328, 540)) {
		target = targetList[0];
		sprite_index = spr_node_right1;
	}
	else if(point_in_rectangle(mouse_x, mouse_y, 1332, 541, 1364, 575)) {
		target = targetList[1];
		sprite_index = spr_node_right2;
	}*/
}