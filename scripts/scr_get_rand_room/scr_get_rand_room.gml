// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Returns a random room on that level based on the level given
function get_rand_room(_level)
{
	randomize();
	
	// Possible choices for the random room function
	roomLayout = 
	[
		[rm_Basement_1, rm_Basement_2, rm_Basement_3, rm_Basement_4, rm_Basement_5], // Level 1
		[rm_Gwall_1, rm_Gwall_2, rm_Gwall_3, rm_Gwall_4, rm_Gwall_5], // Level 2
		[rm_Kitchen_1, rm_Kitchen_2, rm_Kitchen_3, rm_Kitchen_4, rm_Kitchen_5], // Level 3
		[rm_Bwall_1, rm_Bwall_2, rm_Bwall_3, rm_Bwall_4, rm_Bwall_5], // Level 4
		[rm_Hedge_1, rm_Hedge_2, rm_Hedge_3, rm_Hedge_4, rm_Hedge_5]  // Level 5
	];
	
	var _possibleRooms = roomLayout[_level-1];
	var _numPossibleRooms = array_length(_possibleRooms);
	
	return _possibleRooms[irandom(_numPossibleRooms-1)];
}

// Generates a list with each spot in the array a random room from that level
// Ex. [Random level 1 room, random level 2 room, etc.]
function generate_room_list()
{
	global.roomOrder = [];
	
	for (var i = 1; i <= 5; i++)
	{
		array_push(global.roomOrder, get_rand_room(i));
	}
}

// Gets the room to go to based on the level the player is on
// and the room set in the room order
function get_next_room()
{
	if (array_length(global.roomOrder) == 0) generate_room_list();
	return global.roomOrder[global.level-1];
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