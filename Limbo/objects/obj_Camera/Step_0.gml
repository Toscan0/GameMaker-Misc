/// @description Update Camera position

if(instance_exists(target))
{
	xPos = target.x;
	yPos = target.y;
}

x += (xPos - x) / 25;
y += (yPos - y) / 25;

camera_set_view_pos(cam, x - view_w_half, y -view_h_half);