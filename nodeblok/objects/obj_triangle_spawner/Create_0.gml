/// @description Insert description here
// You can write your code in this editor
cooldown = 120;
lastSpawn = 0;

if(instance_number(obj_node) == 1) {
	inst = instance_nearest(x, y, obj_node);
	target = [inst.x, inst.y];
}
else if(instance_number(obj_node) == 2) {
	inst1 = instance_nth_nearest(x, y, obj_node, 1);
	inst2 = instance_nth_nearest(x, y, obj_node, 2);
}