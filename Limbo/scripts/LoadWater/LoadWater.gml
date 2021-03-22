aux = 50;
timer = room_speed * aux;

with(obj_Water)
{
	if (timer >= 0) 
	{
		timer--;
		
		bodyWidth += ( myW / (room_speed * other.aux));
		columnWidth = (bodyWidth / columns);
	}

	if (timer < 0)
	{
		bodyWidth = myW;
		columnWidth = (bodyWidth / columns);
		timer = -1; 
	}	
	
	
}