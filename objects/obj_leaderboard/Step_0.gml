/// @description reset saved leaderboard

//global.topSenseUseTime  = [[], [], [], []];
//global.topTimeCompleted = [[], [], [], []];

if (keyboard_check(vk_control) && keyboard_check(vk_shift) && (keyboard_check_pressed(ord("R"))))
{
	global.topSenseUseTime  = [[], [], [], []];
	global.topTimeCompleted = [[], [], [], []];
	
	save_leaderboard_data();
}