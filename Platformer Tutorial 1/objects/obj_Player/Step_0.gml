/// @description Core player logic


// --- Get player input  ---
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_up);


// --- Calculate movement ---
// Horizontal Move
var move = key_right - key_left;
horizontalSpeed = move * walkSpeed;
// Vertical Move
verticalSpeed = verticalSpeed + grv;

if(place_meeting(x, y + 1, obj_Wall) && (key_jump))
{
	verticalSpeed = -jumpSpeed
}


// --- Collisions ---
// Horizontal collision
if(place_meeting(x + horizontalSpeed, y, obj_Wall))
{
	while (!place_meeting(x + sign(horizontalSpeed), y, obj_Wall))
	{
		x = x + sign(horizontalSpeed);
	}
	horizontalSpeed = 0;
}
x = x + horizontalSpeed;

// Vertical collision
if(place_meeting(x, y + verticalSpeed, obj_Wall))
{
	while (!place_meeting(x, y + sign(verticalSpeed), obj_Wall))
	{
		y = y + sign(verticalSpeed);
	}
	verticalSpeed = 0;
}
y = y + verticalSpeed;


// --- Animation ---
if(!place_meeting(x, y + 1, obj_Wall))
{
	sprite_index = sptr_Player_Jump;
	image_speed = 0;
	
	if(verticalSpeed > 0)
	{
		// fall
		image_index = 1;
	}
	else 
	{
		// jump
		image_index = 0;
	}	
}
else
{
	image_speed = 1;
	
	if(horizontalSpeed == 0)
	{
		sprite_index = sptr_Player_Iddle;
	}
	else
	{
		sprite_index = sptr_Player_Walk;
	}
}

// Invert sprite
if(horizontalSpeed != 0)
{
	image_xscale = sign(horizontalSpeed);
}