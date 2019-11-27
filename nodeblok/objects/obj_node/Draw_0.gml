/// @description Insert description here

with(obj_node) {
if (position_meeting(mouse_x,mouse_y, obj_node)){
	draw_self()
	outline_start(1,c_white)
}
else
{
	draw_self()
}
}