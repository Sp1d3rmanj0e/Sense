/// @description

if (room == rm_1_introCutscene)
{
	layID = TransitionStart(sq_startScene, rm_2_introHallway);
}
else if (room == rm_3_introFightCutscene)
{
	layID = TransitionStart(sq_fightScene, rm_4_introFightAftermath);
}