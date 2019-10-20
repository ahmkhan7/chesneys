/// @description Insert description here
// You can write your code in this editor

if (currentTarget < array_length_1d(targetList) - 1)
	currentTarget++;
else
	currentTarget = 0;
	
target = targetList[currentTarget];
/* DONT WORRY ABOUT THIS CODE: IT IS OLD BUT SHOULD BE SAVED IN CASE IT WILL BE MODIFIED FOR LEVEL GENERATION
if (finalNode) //if the node should point to a station, this code will run.
{
	if(currentStation < ds_list_size(stations) -1)//if the current station pointing is not the last in the list, point to next
	{
		currentStation ++;
	}
	else //if pointing to next avail station, point to first in list
	{
		currentStation = 0;
	}
	newTarget = ds_list_find_value(stations, currentStation);
}

else //if not a final node, point to nodes in next row
{
	possibleDirections = ds_list_create(); //creates list of possible directions to point
	for (var i = 0; i < instance_number(obj_node); i++) //finds all nodes and takes the x,y of those a row below
	{
	
		otherNode = instance_find(obj_node, i);
		if (otherNode.row == row + 1)//if in row below
		{
			ds_list_add(possibleDirections, [otherNode.x, otherNode.y])//add to list of directions based on x,y
		}
	}

	if (ds_list_size(possibleDirections) > 0) //make sure there is a valid direction
	{
		//default direction is the first node in the row found
		newTarget = ds_list_find_value(possibleDirections, 0);


		numDirections = ds_list_size(possibleDirections);//number of possible directions

		for (var i = 0; i < numDirections; i++) //if the x and y is currently pointing at a possible direction, the new direction will be the next stored x,y
		{										//this can be thought of as a list, where if the node currently points at one list object, we want it to now point to the next
			otherPos = ds_list_find_value(possibleDirections, i);
			var x1 = target[0];
			var x2 = otherPos[0];
			var y1 = target[1];
			var y2 = otherPos[1];
			if (x1 == x2 && y1 == y2)
			{
				if (i != numDirections - 1)
				{
					newTarget = ds_list_find_value(possibleDirections, i+1);
				}
				else
				{
					newTarget = ds_list_find_value(possibleDirections, 0);
				}
			}
		}
		ds_list_destroy(possibleDirections);
	}
}

target = newTarget;
*/