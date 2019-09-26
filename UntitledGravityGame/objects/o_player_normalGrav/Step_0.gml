///standard platform movement

//controls for movement
hkey = keyboard_check(vk_right) - keyboard_check(vk_left);

if(keyboard_check(vk_right)&&canMove==true)
{
	image_xscale=1;	
}
if(keyboard_check(vk_left)&&canMove==true)
{
	image_xscale=-1;	
}

//check if on ground
if(place_free(x, y+1)&&canMove==true)
{
    gravity = 0.5; //set gravity - we are in the air!
	in_air = true;
} 
else
{
    gravity = 0; //no need for gravity on ground
	in_air = false;
    //we are on ground so we can check if we need to jump
    if(keyboard_check_pressed(vk_up)&&canMove==true)
	{
        vspeed = -8;
    }
}

//set horizontal movement based on controls
if(hkey == 0 && canMove==true)
{
    hspeed *= 0.75; //friction
    if(abs(hspeed) < 0.5)
	{
		hspeed = 0; 
	}
} 
else 
{
    hspeed *= 0.75;
    hspeed += 1.5 * sign(hkey);
}

//Change gravity when space key pressed
if(keyboard_check_pressed(vk_space)&&canMove==true) and flipUnlocked == true
{
		if(flipDelay == 0)
		{
			instance_change(o_player_180Grav, true);	
			image_angle+=180;
			flipDelay = 20;
		}
}

if(flipDelay > 0)
{
	flipDelay = flipDelay - 1;
}

if(keyboard_check_pressed(vk_shift) and canMove==true) and (hspeed>0 or hspeed<0) and (dashUnlocked==true)
{
	canMove = false;
	dashFrames = 20;
}

if(dashFrames > 0)
{
	if(keyboard_check(vk_right))
	{
		instance_create_layer(x,y,0,o_player_dash_effect);
		dashFrames = dashFrames - 1;
		hspeed = 9;
		vspeed = 0;
		if(dashFrames == 0)
		{
			canMove = true;	
		}
	}
	if(keyboard_check(vk_left))
	{
		instance_create_layer(x,y,0,o_player_dash_effect);
		dashFrames = dashFrames - 1;
		hspeed = -9;
		vspeed = 0;
		if(dashFrames == 0)
		{
			canMove = true;	
		}
	}
	
}