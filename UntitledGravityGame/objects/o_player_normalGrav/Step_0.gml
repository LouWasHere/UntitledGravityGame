///standard platform movement

//controls for movement
hkey = keyboard_check(vk_right) - keyboard_check(vk_left);

if(keyboard_check(vk_right))
{
	image_xscale=1;	
}
if(keyboard_check(vk_left))
{
	image_xscale=-1;	
}

//check if on ground
if(place_free(x, y+1))
{
    gravity = 0.5; //set gravity - we are in the air!
	in_air = true;
} 
else
{
    gravity = 0; //no need for gravity on ground
	in_air = false;
    //we are on ground so we can check if we need to jump
    if(keyboard_check_pressed(vk_up))
	{
        vspeed = -8;
    }
}

//set horizontal movement based on controls
if(hkey == 0)
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
if(keyboard_check_pressed(vk_space))
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