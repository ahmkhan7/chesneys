/// @description Insert description here
// You can write your code in this editor
randomize();
cooldown = 30;
start = 0;

//spawns = 0;
//num_square_spawns = 1;

/*
more old code for level generation. not a concern until beta or omega.
//find stations for node pointing
globalvar stations;
stations = ds_list_create();//create a list which holds all the x,y for possible stations

for (var i = 0; i < instance_number(obj_square_station); i++) //finds all square stations and stores the x,y of those
{
	otherStation = instance_find(obj_square_station, i);
	ds_list_add(stations, [otherStation.x, otherStation.y])//add to list of stations based on x,y
}
for (var i = 0; i < instance_number(obj_circle_station); i++) //finds all circle stations and stores the x,y of those
{
	otherStation = instance_find(obj_circle_station, i);
	ds_list_add(stations, [otherStation.x, otherStation.y])//add to list of stations based on x,y
}
*/