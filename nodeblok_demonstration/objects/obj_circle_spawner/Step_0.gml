/// @description Insert description here
// You can write your code in this editor
if (lastSpawn >= cooldown)
{
	instance_create_depth(x, y, 3, obj_circle);
	lastSpawn = 0;
}
lastSpawn ++;