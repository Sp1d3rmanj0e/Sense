/// @description debug leaderboard

/*
if (keyboard_check(vk_control) && keyboard_check(vk_shift) && (keyboard_check_pressed(ord("R"))))
{
	global.topSenseUseTime  = [[], [], [], []];
	global.topTimeCompleted = [[], [], [], []];
	
	save_leaderboard_data();
}

if (keyboard_check(vk_control) && keyboard_check(vk_shift) && (keyboard_check_pressed(ord("T"))))
{
	add_score("Jason Test", 1.23, 0, 0);
	
	save_leaderboard_data();
}