/// @description Insert description here
// You can write your code in this editor
if(!gameEnded)
{
	switch(transform)
	{
		case 1:
			image_speed = 1;
		
			show_debug_message("image_index: "+string(image_index))
			if(image_index > 4)
			{
				sprite_index = spr_wolfwalk;
				transform = -1;
			}
			break;
		case 0:
			image_speed = -1;
			if(image_index < 1)
			{
				sprite_index = spr_hunter;
				transform = -1;
			}
			break;
		case -1:
			if(keyboard_check(vk_right) or mouse_check_button(mb_any))
			{
				//Basic set up

				x += move_speed;
				image_speed = 1;
				image_xscale = 1;
				if(x > 17300)
				{
					gameEnded = true;	
				}
				//layer_background_blend(back_id, color);

			}
			else if(keyboard_check(vk_left))
			{
				x -= move_speed;
				if(x < 0)
				{
					x = 0;	
				}
				image_speed = 1;
				image_xscale = -1;
			}

			else
			{
				image_speed = 0;	
			}
			break;
	}
	
	layer_x("Mountains", x/1.10 - 200);
	layer_x("Hills", x/1.3);
	layer_x("Swamp", x/1.95 + 1000);
	layer_x("Ground", x/1.15);
	//if(keyboard_check(vk_up))
	//{
	//	move_speed++;
	//}
	//if(keyboard_check(vk_down))
	//{
	//	move_speed--;
	//}
	camera_set_view_pos(view_camera[0], x-500, 0);
	sky.x = x;
	stars.x = x+512;
	moon.x = x +200;
	sun.x = x +200;
	var dist = 1920;
	var pos = x+dist*4.5;
	moon.y = dist-abs(sin(pos*(pi/width))*dist)+room_height*0.2;
	sun.y = dist-abs(sin(pos*(pi/width)+(pi/2))*dist)+room_height*0.2;
	stars.image_alpha = abs(cos(pos*(pi/width)+(pi/2)))-0.3;
	
	var distance = x/17300;
	var volume = 0;
	if(distance < 0.5)
	{
		volume = distance*2;
	}
	else
	{
		volume = (1-distance)*2
	}
	audio_sound_gain(Monster, 1-volume, 0);
	audio_sound_gain(Monster2, volume, 0);
	//show_debug_message("ALPHAAA: "+string(sin(pos*(pi/width)+(pi/2))));
	//show_debug_message("starPHAAA: "+string(stars.image_alpha));
	if(moon.y <  470)
	{
		//show_debug_message("TTRANSFORM");
		if(sprite_index == spr_hunter)
		{
			transform = 1;
			sprite_index = spr_transform;
			//y += 32;
		}
	
	
	}
	else
	{
		if(sprite_index == spr_wolfwalk and sun.y < 450)
		{
			transform = 0;
			sprite_index = spr_transform;
			image_index = 4;
			//y -= 32;
		}
	
	}

	//color_b = color_b - b_speed < 0 ? 0 : color_b - b_speed;
	color_r = abs(sin(pos*(pi/width))*red);
	color_g = green-abs(sin(pos*(pi/width))*green)+min_g;
	color_b = blue-abs(sin(pos*(pi/width))*blue)+min_b;
	var color = make_color_rgb(color_r, color_g, color_b);
	sky.image_blend = color;

	if(keyboard_check(vk_escape))
	{
		//x += move_speed;
		game_end();
	}
}