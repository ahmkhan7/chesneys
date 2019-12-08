first_node = instance_nearest(0, 0, obj_node);
second_node = instance_nth_nearest(0, 0, obj_node, 2);
third_node = instance_nth_nearest(0, 0, obj_node, 3);
cookstat_inst = instance_nearest(0, 0, obj_cooking_pot);
targetList = [[0, 0]];
currentTarget = 0;
target = [cookstat_inst.x, cookstat_inst.y];
with(first_node) {
    second_node = instance_nth_nearest(0, 0, obj_node, 2);
    first_trash_can = instance_nearest(0, 0, obj_trash_can);
    targetList[0] = [second_node.x, second_node.y];
    targetList[1] = [first_trash_can.x, first_trash_can.y];
    currentTarget = 0;
    target = targetList[currentTarget];
	sprite_index = spr_node;
	image_angle = point_direction(x , y, target[0], target[1]);
}
with(second_node) {
    first_node = instance_nearest(0, 0, obj_node);
    third_node = instance_nth_nearest(0, 0, obj_node, 3);
    cookstat_inst = instance_nearest(0, 0, obj_cooking_pot);
    targetList[0] = [cookstat_inst.x, cookstat_inst.y];
    targetList[1] = [third_node.x, third_node.y];
    targetList[2] = [first_node.x, first_node.y];
    currentTarget = 0;
    target = targetList[currentTarget];
	sprite_index = spr_node_mid1;
}
with(third_node) {
    second_node = instance_nth_nearest(0, 0, obj_node, 2);
    second_trash_can = instance_nth_nearest(0, 0, obj_trash_can, 2);
    targetList[0] = [second_node.x, second_node.y];
    targetList[1] = [second_trash_can.x, second_trash_can.y];
    currentTarget = 0;
    target = targetList[currentTarget];
	sprite_index = spr_node;
	image_angle = point_direction(x , y, target[0], target[1]);
}