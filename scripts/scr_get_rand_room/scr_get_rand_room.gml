// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Returns a random room based on the level given
function get_rand_room(_level)
{
	// Possible choices for the random room function
	roomLayout = 
	[
		[rm_Gwall_1], // Level 1
		[rm_Gwall_2], // Level 2
		[rm_Gwall_3], // Level 3
		[rm_Gwall_4], // Level 4
		[rm_Gwall_5]  // Level 5
	];
	
	var _possibleRooms = roomLayout[_level-1];
	var _numPossibleRooms = array_length(_possibleRooms);
	
	return _possibleRooms[irandom(_numPossibleRooms-1)];
}

function get_room_door(isFront)
{
	switch(global.level)
	{
		case 1: if (isFront) return spr_basement_door_front else return spr_basement_door_left;
		case 2: if (isFront) return spr_door_front else return spr_door_left;
		case 3: if (isFront) return spr_kitchen_door_front else return spr_kitchen_door_left;
		case 4: if (isFront) return spr_door_front else return spr_door_left;
		case 5: if (isFront) return spr_hedge_door_front else return spr_hedge_door_left;
		default: if (isFront) return spr_door_front; else return spr_door_left;
	}
}

function get_gold_room_door(isFront)
{
	switch(global.level)
	{
		case 1: if (isFront) return spr_basement_door_front_gold else return spr_basement_door_left_gold;
		case 2: if (isFront) return spr_door_front_gold else return spr_door_left_gold;
		case 3: if (isFront) return spr_kitchen_door_front_gold else return spr_kitchen_door_left_gold;
		case 4: if (isFront) return spr_door_front_gold else return spr_door_left_gold;
		case 5: if (isFront) return spr_hedge_door_front_gold else return spr_hedge_door_left_gold;
		default: if (isFront) return spr_door_front; else return spr_door_left;
	}
}