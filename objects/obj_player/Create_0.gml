/// @description Insert description here
// You can write your code in this editor
move_speed = 5;
color_r = 20;
color_g = 20;
color_b = 255;
r_speed = 1;
g_speed = 1;
b_speed = 1;
transform = -1;
sky = instance_find(obj_sky, 0);
stars = instance_find(obj_stars, 0);
moon = instance_find(obj_moon, 0);
sun = instance_find(obj_sun, 0);

window_set_fullscreen(true);
//camera_set_view_pos(view_camera[0], 0, 0);
//camera_set_view_size(view_camera[0], 1920, 1080);
////Setting up object target information
//camera_set_view_target(view_camera[0], id);
//camera_set_view_speed(view_camera[0], -1, -1);
//camera_set_view_border(view_camera[0], 1920, 540);

color_b = color_b - b_speed < 0 ? 0 : color_b - b_speed;
//var width = 1920*4;
width = 1920*6;
gameStarted = false;
titleAlpha = 1;
textAlpha = 0;
gameEnded = false;
//color_b = abs((1/width)*power(x-width*0.5,2)*0.5);
min_r = 10;
min_g = 0;
min_b = 10;
red = 10;
green = 180;
blue = 255-min_b;
color_r = red-abs(sin(x*(pi/width))*red)+min_r;
color_g = green-abs(sin(x*(pi/width))*green)+min_g;
color_b = blue-abs(sin(x*(pi/width))*blue)+min_b;
//show_debug_message("color_b: "+string(color_b));
//show_debug_message("x: "+string(x));
var color = make_color_rgb(color_r, color_g, color_b);
sky.image_blend = color;

audio_play_sound(Monster, 0, true);
audio_play_sound(Monster2, 0, true);
audio_sound_gain(Monster2, 0, 0); // Set to 50% volume immediately

//var lay_id = layer_get_id("Background");
//var back_id = layer_background_get_id(lay_id);
////color_r = color_r + r_speed > 255 ? 255 : color_r + r_speed;
////color_g = color_g + g_speed > 255 ? 255 : color_g + g_speed;
//color_b = color_b - b_speed < 0 ? 0 : color_b - b_speed;

//var color = make_color_rgb(color_r, color_g, color_b);
//layer_background_blend(back_id, color);