//Destroy any ingredient that collides with this trashcan.
instance_destroy(other);
audio_play_sound(Trash_can_disposal, 2, false);