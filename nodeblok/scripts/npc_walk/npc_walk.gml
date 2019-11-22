
{
var grid,dir,x1,y1,hgrid,vgrid;
if(path_index != -1)exit;
else if(path_exists(path) && path_position == 1)path_delete(path);
//Only try every once in a while...
if(floor(random(50)) == 0)
    {
    //Minor Values
    hgrid = (argument1/2);
    vgrid = (argument2/2);
    dir = choose(0,90,180,270);
    
    //Determine the New Coordinates
    x1 = x + (cos(dir*pi/180)*argument1);
    y1 = y + (-sin(dir*pi/180)*argument2);
    
    //Detect Collision with the wallparentobject
    if(!collision_rectangle(x1-hgrid,y1-vgrid,x1+hgrid,y1+vgrid,argument0,1,1))
        {
        path = path_add();
        //If none, create the grid
        grid = mp_grid_create(x-(argument1 + hgrid),y-(argument2 + vgrid),3,3,argument1,argument2);
        
        //Disable locations occupied by the wallparentobject
        mp_grid_add_instances(grid,argument0,1);
        
        //Allow your own space
        mp_grid_clear_cell(grid,2,2);
        
        //If the NPC can move there, do it!
        if(mp_grid_path(grid,path,x,y,x1,y1,0))path_start(path,1,0,1);
        mp_grid_destroy(grid);
        }
    else npc_walk(argument0,argument1,argument2);//Attempt a re-try
    }
}
