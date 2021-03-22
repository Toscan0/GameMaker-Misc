/// @description GUI/Vars menu setup

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin  = 150;

menu_x = (gui_width / 2);
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_font = font_Menu;
menu_itemHeight = font_get_size(font_Menu);
menu_committed = -1;
menu_control = true;
menu[1] = "Restart";
menu[0] = "Quit";
menu_cursor = 1;