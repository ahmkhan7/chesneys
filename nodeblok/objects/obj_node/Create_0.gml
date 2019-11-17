/// @description Insert description here  
//target system: particles move towards target using move_towards_point command. targets are inherited on collisions.
//targets also dictate where nodes will point and for spawners targets dictate where particles will first move to.
first_node = instance_nearest(0, 0, obj_node);
second_node = instance_nth_nearest(0, 0, obj_node, 2);
cookstat_inst = instance_nearest(0, 0, obj_cooking_pot);
targetList = [[0, 0]];
currentTarget = 0;
target = [cookstat_inst.x, cookstat_inst.y];
with(first_node) {
	cookstat_inst = instance_nearest(0, 0, obj_cooking_pot);
	compstat_inst = instance_nearest(0, 0, obj_compost_bin);
	targetList[0] = [compstat_inst.x, compstat_inst.y];
	targetList[1] = [cookstat_inst.x, cookstat_inst.y];
	currentTarget = 0;
	target = targetList[currentTarget];
	direction = point_direction(x , y, target[0], target[1]);
}
with(second_node) {
	cookstat_inst = instance_nearest(0, 0, obj_cooking_pot);
	compstat_inst = instance_nth_nearest(0, 0, obj_compost_bin, 2);
	targetList[1] = [compstat_inst.x, compstat_inst.y];
	targetList[0] = [cookstat_inst.x, cookstat_inst.y];
	currentTarget = 1;
	target = targetList[currentTarget];
	direction = point_direction(x , y, target[0], target[1]);
}