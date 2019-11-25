/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(spr_sliderbar, -1, x, y, size_scale, size_scale , 0, c_white, 1);
middle = (y + sprite_get_height(spr_sliderbar) * size_scale / 2);
draw_set_halign(fa_center);
draw_sprite_ext(spr_slider, -1, x + size_scale*currentVal, middle, size_scale, size_scale, 0, c_white, 1);
draw_text(x + xMax, middle, currentVal);
