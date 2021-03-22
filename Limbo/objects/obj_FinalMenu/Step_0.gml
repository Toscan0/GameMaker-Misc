/// @description Control Menu

if(menu_control)
{
	if(keyboard_check_pressed(vk_up))
	{
			menu_cursor++;
			if(menu_cursor >= array_length_1d(menu))
			{
				menu_cursor = 0;
			}
	}
	else if(keyboard_check_pressed(vk_down))
	{
			menu_cursor--;
			if(menu_cursor < 0)
			{
				menu_cursor = array_length_1d(menu) - 1;
			}
	}
	
	if(keyboard_check_pressed(vk_enter))
	{
		menu_committed = menu_cursor;
		menu_control = false;
	}
}

if(menu_committed != -1) 
{
	switch(menu_committed)
	{
		case 1:
			SlideTransition(TRANS_MODE.GOTO, Room_InitialMenu);
			break;
		case 0:
			game_end();
			break;
	}
}