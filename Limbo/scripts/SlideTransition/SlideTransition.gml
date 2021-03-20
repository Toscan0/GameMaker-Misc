/// @description SlideTransition(mode, targetRoom);
/// @arg mode:  sets transition mode between next, restart and goto
/// @arg targetRoom: sets target room when using the goto mode

with(obj_Transition)
{
	mode = argument[0];
	if(argument_count == 2)
	{
		targetRoom = argument[1];
	}
}