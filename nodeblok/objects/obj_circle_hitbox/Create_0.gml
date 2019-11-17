first_circle_hitbox = instance_nearest(0, 0, obj_circle_hitbox);
second_circle_hitbox = instance_nth_nearest(0, 0, obj_circle_hitbox, 2);
third_circle_hitbox = instance_nth_nearest(0, 0, obj_circle_hitbox, 3);
with(first_circle_hitbox) {
    first_node = instance_nearest(0, 0, obj_node);  
}
with(second_circle_hitbox) {
    second_node = instance_nth_nearest(0, 0, obj_node, 2);
}
with(third_circle_hitbox) {
    third_node = instance_nth_nearest(0, 0, obj_node, 3);
}