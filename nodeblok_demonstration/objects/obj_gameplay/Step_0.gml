/// @description Gameplay
//Demonstration only, no cooldown for spawns
//Set number of squares spawn (one)
//Collision with stations do nothing (yet)

/*
if(spawns < num_square_spawns) {
	square[spawns] = instance_create_depth(obj_square_spawner.x, obj_square_spawner.y, 3, obj_square);
	with(square[spawns]) {
		point_direction(0, 0, obj_node.x, obj_node.y); //Move towards the node
		speed = 3;
	}
	spawns++
}
*/
if (spawns < num_square_spawns)
{
	instance_create_depth(obj_square_spawner.x, obj_square_spawner.y, 3, obj_square);
	spawns++;
}

