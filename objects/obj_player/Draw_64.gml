/// @description Insert description here
// You can write your code in this editor


if(gameEnded)
{
	image_speed = 0;
	titleAlpha = min(titleAlpha + 0.005, 1);	
	if(titleAlpha == 1)
	{
		textAlpha = min(textAlpha + 0.0025, 1);	
	}
	draw_set_alpha(titleAlpha);
	draw_sprite(spr_title, 0,0,0);
	draw_set_alpha(textAlpha);
	draw_set_color(c_white);
	draw_set_font(fnt_title2);
	var text1 = "It's the one who is different";
	draw_text(350,400,text1);
	text1 = "who is often considered";
	draw_text(450,520,text1);
	text1 = "the monster.";
	draw_text(640,640,text1);
	draw_set_color(c_black);
	draw_set_alpha(1);
	if(textAlpha == 1)
	{
		if(keyboard_check(vk_anykey))
		{
			game_end();
		}
	}
}
else
{
	if(!gameStarted)
	{
		if(keyboard_check(vk_anykey))
		{
			gameStarted = true;
		}
	}
	else
	{
		titleAlpha = max(titleAlpha - 0.01, 0);	
	}
	draw_set_alpha(titleAlpha);
	draw_sprite(spr_title, 0,0,0);
	draw_set_color(c_white);
	draw_set_font(fnt_title);
	var xPos = (1920 - string_length("Monster")*font_get_size(fnt_title))*0.5;
	draw_text(xPos,300,"Monster");
	draw_set_font(fnt_title2);
	xPos = (1920 - string_length("Press any key to start")*font_get_size(fnt_title2))*0.5+50;
	draw_text(xPos,600,"Press any key to start");
	draw_set_color(c_black);
	draw_set_alpha(1.0);
}
