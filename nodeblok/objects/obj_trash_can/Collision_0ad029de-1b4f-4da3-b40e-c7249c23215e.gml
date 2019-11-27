//Destroy any ingredient that collides with this trashcan.
instance_destroy(other);

//Play the trash can collision audio in any room but the menu
if(room != menu_room)
	audio_play_sound(Trash_can_disposal, 2, false);