/// @description Insert description here
// You can write your code in this editor
if(obj_node.state == 1)
	direction = point_direction(obj_node.x, obj_node.y, obj_square_station.x, obj_square_station.y);
else
	direction = point_direction(obj_node.x, obj_node.y, obj_circle_station.x, obj_circle_station.y);