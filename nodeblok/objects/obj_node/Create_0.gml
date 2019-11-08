/// @description Insert description here  
//target system: particles move towards target using move_towards_point command. targets are inherited on collisions.
//targets also dictate where nodes will point and for spawners targets dictate where particles will first move to.
targetList = [[0, 0]];
currentTarget = 0;
counter = 0;

if(instance_number(obj_node) == 1) {
	sqrstat_inst = instance_nearest(x, y, obj_square_station);
	tristat_inst = instance_nearest(x, y, obj_triangle_station);
	cirstat_inst = instance_nearest(x, y, obj_circle_station);
	if(cirstat_inst != noone) {
		targetList[counter] = [cirstat_inst.x, cirstat_inst.y];
		counter++;
	}
	if(sqrstat_inst != noone) {
		targetList[counter] = [sqrstat_inst.x, sqrstat_inst.y];
		counter++;
	}
	if(tristat_inst != noone) {
		targetList[counter] = [tristat_inst.x, tristat_inst.y];
		counter++;
	}
}

if(instance_number(obj_node) == 2) {
	if(x < room_width / 2) {
		sqrstat_inst = instance_nearest(x, y, obj_square_station);
		tristat_inst = instance_nearest(x, y, obj_triangle_station);
		if(sqrstat_inst != noone) {
			targetList[counter] = [sqrstat_inst.x, sqrstat_inst.y];
			counter++;
		}
		if(tristat_inst != noone) {
			targetList[counter] = [tristat_inst.x, tristat_inst.y];
			counter++;
		}
	}
	else {
		tristat_inst = instance_nearest(x, y, obj_triangle_station);
		cirstat_inst = instance_nearest(x, y, obj_circle_station);
		if(tristat_inst != noone) {
			targetList[counter] = [tristat_inst.x, tristat_inst.y];
			counter++;
		}
		if(cirstat_inst != noone) {
			targetList[counter] = [cirstat_inst.x, cirstat_inst.y];
			counter++;
		}
	}
}

target = targetList[currentTarget];