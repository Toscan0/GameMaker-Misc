/// @description Load next scene

with(obj_Player)
{
	if(canMove)
	{
		canMove = false;
		SlideTransition(TRANS_MODE.NEXT);
	}
}
