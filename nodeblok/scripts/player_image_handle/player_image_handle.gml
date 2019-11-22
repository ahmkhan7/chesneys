{
var cycle;

//Determine if the NPC has moved
if(x != xprevious || y != yprevious)
    {
    depth = -y;
    cycle = 1; 
    lastdir = point_direction(xprevious,yprevious,x,y);
    }
else
    {
    cycle = 0;
    image_single = 0;
    }

//Change the Sprite when the last direction is different
if(lastdir >= 315 || lastdir <= 45)sprite_index = sprright;
if(lastdir >= 45 && lastdir <= 135)sprite_index = sprup;
if(lastdir >= 135 && lastdir <= 225)sprite_index = sprleft;
if(lastdir >= 225 && lastdir <= 315)sprite_index = sprdown;

//Change the Image Index every image_number scaled by the room_speed
timer -= 1;
if(timer <= 0)
    {
    if(cycle)image_single += 1;
    timer = (room_speed/50)*image_number;
    }
}
