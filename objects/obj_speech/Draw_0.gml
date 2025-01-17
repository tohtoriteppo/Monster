/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_self();
var size = font_get_size(fnt_speech);
//draw_rectangle(x,y,x+string_width(text)*1.2, y+size*3, false);
draw_set_font(fnt_speech);
draw_set_color(c_black);
if(image_yscale > 1)
{
	draw_text(x+size, y+sprite_height*0.5-size*2, text);
}
else
{
	draw_text(x+size, y+sprite_height*0.5-size, text);
}

//show_debug_message("size: "+string(size));
//show_debug_message("x: "+string(x)+" y: "+string(y));