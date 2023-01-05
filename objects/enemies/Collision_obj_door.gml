/// @description Open door upon collision

with(other) 
{
	if(doorOpen == false)
	{
		doorOpen = true;
		event_user(0);
	}
}