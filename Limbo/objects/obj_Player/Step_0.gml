/// @description Core player logic


// --- Get player input  ---
if(canMove)
{
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_jump = keyboard_check_pressed(vk_up);
}
else
{
	key_left = 0;
	key_right = 0;
	key_jump = 0;
}

// --- Calculate movement ---
// Horizontal Move
var move = key_right - key_left;
horizontalSpeed = move * walkSpeed;
// Vertical Move
verticalSpeed = verticalSpeed + grv;

if(place_meeting(x, y + 1, obj_InvisibleWall) && (key_jump))
{
	verticalSpeed = -jumpSpeed
}


// --- Collisions ---
// Horizontal collision
if(place_meeting(x + horizontalSpeed, y, obj_InvisibleWall))
{
	while (!place_meeting(x + sign(horizontalSpeed), y, obj_InvisibleWall))
	{
		x = x + sign(horizontalSpeed);
	}
	horizontalSpeed = 0;
}
if(place_meeting(x + horizontalSpeed, y, obj_wood))
{
	while (!place_meeting(x + sign(horizontalSpeed), y, obj_wood))
	{
		x = x + sign(horizontalSpeed);
	}
	horizontalSpeed = 0;
}
x = x + horizontalSpeed;

// Vertical collision
if(place_meeting(x, y + verticalSpeed, obj_InvisibleWall))
{
	while (!place_meeting(x, y + sign(verticalSpeed), obj_InvisibleWall))
	{
		y = y + sign(verticalSpeed);
	}
	verticalSpeed = 0;
}
if(place_meeting(x, y + verticalSpeed, obj_wood))
{
	while (!place_meeting(x, y + sign(verticalSpeed), obj_wood))
	{
		y = y + sign(verticalSpeed);
	}
	verticalSpeed = 0;
}

y = y + verticalSpeed;


// --- Animation ---
if(!place_meeting(x, y + 1, obj_InvisibleWall))
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
	if(sprite_index == sptr_Player_Jump)
	{
		audio_play_sound(sound_Landing, 5, false);	
	}
	
	image_speed = 1;
	if(horizontalSpeed == 0)
	{
		sprite_index = sptr_Player_Idle;
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